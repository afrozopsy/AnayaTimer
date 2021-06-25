
/// Created by Umar Bin Ayaz on 25.06.2021
/// Copyright © 2021 Umar Bin Ayaz. All rights reserved.
/// 
/// Email: afrozopsy.dev.com
/// Website: https://github.com/afrozopsy

class AnayaTimer {

  final Duration duration;
  final void Function() callBack;

  Stopwatch stopwatch;
  int noOfTicks;

  AnayaTimer(
    this.duration,
    this.callBack
  ){
    stopwatch = Stopwatch();
    noOfTicks = 0;
  }

  void _loop() {

    if(
      (stopwatch.elapsed.inMilliseconds >= duration.inMilliseconds) &&
      stopwatch.isRunning
    ){

      callBack();
      noOfTicks = noOfTicks + 1;
      _reloop();

    } else {

      if(stopwatch.isRunning){
        _callLoop();
      }

    }

  }

  void _callLoop(){
    Future.delayed(Duration(milliseconds: 1), (){
      _loop();
    });
  }

  void _reloop(){
    stopwatch.reset();
    _loop();
  }

  /**
   * Sets the [stopwatch.isRunning] to true and calls _loop.
   *
   * If [AnayaTimer] is already running them calling [start] again
   * has no effect.
   */
  void start(){
    stopwatch.start();
    _loop();
  }

  /**
   * Sets the [stopwatch.isRunning] to false. Timer stops
   * and [callBack] is not called again unless either
   * [start] or [restart] is called.
   *
   * If [AnayaTimer] is already stopped them calling [stop] again
   * has no effect.
   */
  void stop(){
    stopwatch.stop();
  }

  /**
   * Resets the passed time count for next execution to zero.
   *
   * This method does not stop or start the [AnayaTimer].
   */
  void reset(){
    stopwatch.reset();
  }

  /**
   * Sets the [stopwatch.isRunning] to true and calls _loop. Also
   * calls build-in [reset] function as well, so that the elapsed
   * time is set to zero and timer is started again from 0.
   *
   * If [AnayaTimer] is already running them calling [restart] just
   * resets the timer which is it starts again from 0 elapsed time.
   */
  void restart(){
    stopwatch.reset();
    stopwatch.start();
    _loop();
  }

}