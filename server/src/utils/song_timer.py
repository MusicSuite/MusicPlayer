import asyncio
import threading
import time
from asyncio import Task
from typing import Callable, Any

from src.model.playerstate import PlayerState


class SongTimer:
    state: PlayerState = PlayerState.STOPPED
    _lock: threading.Lock = threading.Lock()
    _timer_start_time: float
    _song_start_time: float
    _song_duration: float
    _callback: Callable[[], None]
    _task: Task[Any] = None

    def start(self, duration, callback):
        with self._lock:
            if self.state is not PlayerState.PLAYING:
                self.state = PlayerState.PLAYING
                self._callback = callback
                self._timer_start_time = time.time()
                self._song_start_time = 0
                self._song_duration = duration
                self._task = asyncio.create_task(self._timer_task(self._callback))

    def pause(self):
        with self._lock:
            if self.state is PlayerState.PLAYING:
                self._unsafe_stop()
                self.state = PlayerState.PAUSED

    def resume(self):
        with self._lock:
            if self.state is PlayerState.PAUSED:
                self._timer_start_time = time.time()
                asyncio.create_task(self._timer_task(self._callback))
                self.state = PlayerState.PLAYING

    def get_song_timer(self):
        if self.state is PlayerState.STOPPED:
            return 0

        current_time = self._song_start_time
        if self.state is PlayerState.PLAYING:
            current_time += time.time() - self._timer_start_time
        return current_time

    def stop(self):
        with self._lock:
            if self.state is not PlayerState.STOPPED:
                self._unsafe_stop()

    def _unsafe_stop(self):
        self._song_start_time = self.get_song_timer()
        self.state = PlayerState.STOPPED
        self._task.cancel("Was paused or stopped")

    async def _timer_task(self, callback):
        try:
            await asyncio.sleep(self._song_duration - self._song_start_time)
            call_callback = False
            with self._lock:
                if self.state is PlayerState.PLAYING:
                    self._unsafe_stop()
                    call_callback = True

            # Don't call this callback using a lock
            if call_callback:
                await callback()
        # The task has been cancelled, no need to log there has been a pause at a moment
        except asyncio.CancelledError:
            pass


# Example usage:
async def callback():
    print("Timer expired!")


async def main():
    timer = SongTimer()

    # Start the timer for 5 seconds
    timer.start(5, callback)

    print("Timer started")
    # Simulate some other async tasks running concurrently
    print(timer.get_song_timer())
    await asyncio.sleep(2)

    # Pause the timer
    timer.pause()
    print("Timer paused")
    print(timer.get_song_timer())

    # Simulate some time passing while the timer is paused
    await asyncio.sleep(2.5)
    # Resume the timer
    timer.resume()
    print("Timer resumed")
    print(timer.get_song_timer())

    # Allow some time for the timer to potentially expire
    await asyncio.sleep(1)
    print(timer.get_song_timer())

    await asyncio.sleep(4)
    print(timer.get_song_timer())


if __name__ == "__main__":
    asyncio.run(main())
