pragma Singleton

import Quickshell

Singleton {
  // Formats a Date object into a YYYYMMDD-HHMMSS string.
  function _getFormattedTimestamp() {
    const date = new Date();
    const year = date.getFullYear();

    // getMonth() is zero-based, so we add 1
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');

    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');
    const seconds = String(date.getSeconds()).padStart(2, '0');

    return `${year}${month}${day}-${hours}${minutes}${seconds}`;
  }

  function _formatMessage(...args) {
    var t = _getFormattedTimestamp();
    if (args.length > 1) {
      const maxLength = 14;
      var module = args.shift().substring(0, maxLength).padStart(maxLength, " ");
      return `\x1b[36m[${t}]\x1b[0m \x1b[35m${module}\x1b[0m ` + args.join(" ");
    } else {
      return `[\x1b[36m[${t}]\x1b[0m ` + args.join(" ");
    }
  }

  function _getStackTrace() {
    try {
      throw new Error("Stack trace");
    } catch (e) {
      return e.stack;
    }
  }

  // Debug log (only when Settings.isDebug is true)
  function d(...args) {
    // TODO:
    // if (Settings?.isDebug) {
    //   var msg = _formatMessage(...args);
    //   console.debug(msg);
    // }
    var msg = _formatMessage(...args);
    console.debug(msg);
  }

  // Info log (always visible)
  function i(...args) {
    var msg = _formatMessage(...args);
    console.info(msg);
  }

  // Warning log (always visible)
  function w(...args) {
    var msg = _formatMessage(...args);
    console.warn(msg);
  }

  // Error log (always visible)
  function e(...args) {
    var msg = _formatMessage(...args);
    console.error(msg);
  }

  function callStack() {
    var stack = _getStackTrace();
    Logger.i("Debug", "--------------------------");
    Logger.i("Debug", "Current call stack");
    // Split the stack into lines and log each one
    var stackLines = stack.split('\n');
    for (var i = 0; i < stackLines.length; i++) {
      var line = stackLines[i].trim(); // Remove leading/trailing whitespace
      if (line.length > 0) {
        // Only log non-empty lines
        Logger.i("Debug", `- ${line}`);
      }
    }
    Logger.i("Debug", "--------------------------");
  }
}
