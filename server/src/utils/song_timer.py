import asyncio
import threading
import time

from src.model.playerstate import PlayerState


class SongTimer:
    _thread: threading.Thread = None
    _stop_event: threading.Event = threading.Event()
    song_position: int = 0

    def __init__(self, on_finish):
        self.on_finish = on_finish

    # Threading stuff to keep the song position
    def start(self, duration):
        self.stop()
        self._stop_event.clear()
        self._thread = threading.Thread(target=self._start_timer_loop, args=(duration,))
        self._thread.start()

    def stop(self):
        if self._thread is not None and self._thread.is_alive():
            self._stop_event.set()
            # TODO: Check whether thread needs to be joined or can be ignored
            # self.thread.join()

    def _start_timer_loop(self, duration):
        # Create a new event loop for the thread
        loop = asyncio.new_event_loop()
        asyncio.set_event_loop(loop)

        # Run the asynchronous function
        loop.run_until_complete(self._start_time(duration))

        # Close the event loop
        loop.close()

    async def _start_time(self, duration):
        start_time = time.time()

        while time.time() - start_time < duration and not self._stop_event.is_set():
            time.sleep(1)

            # TODO: Temporarily TRUE
            if True or self.state == PlayerState.PLAYING:
                self.song_position += 1
                print(f"{self.song_position}/{duration}")

        if not self._stop_event.is_set():
            self._stop_event.clear()
            self.on_finish()


if __name__ == "__main__":
    song_timer: SongTimer = SongTimer(lambda: print("FINISHED TIMER"))
    song_timer.start(10)
