# QuickELogger [![License](https://img.shields.io/dub/l/vibe-d.svg)](https://github.com/rbaumbach/InstagramSimpleOAuth/blob/master/MIT-LICENSE.txt)

A quick and simple way to log JSON log messages to disk in your iPhone or iPad app.

## Adding QuickELogger to your project

### Clone from Github

1.  Clone repository from github and copy files directly, or add it as a git submodule.
2.  Add all files from `Source` directory to your project.

## How To

* Import `QuickELogger`.
* Create an instance of `QuickELogger`, and then it's as simple as calling `log(:message:type)`.
* This logger has the following (pretty standard) log types: `verbose, info, debug, warn, error`.

Note: The file is saved in the `/Documents` directory.

Additional note: By default the filename is `QuickELogger.json`.  You can specify a different filename in `init(:filename)`.

### Example Usage

```swift
import QuickELogger

let logger = QuickELogger()

logger(message: "Tacos > Burritos", type: .info)
```

### Gotchas

This logger doesn't append to a log file in the traditional sense.  It reads from a current log (if one exists), and then overwrites that log with updated logs.  This framework was created out of necessity to write logs to disk easily without loading in huge log frameworks and shouldn't be used for ultra-heavy logging.

Plans to make this more "enterprise-ready" are being evaluated.

## Testing

* Prerequisites: [ruby](https://github.com/sstephenson/rbenv), [ruby gems](https://rubygems.org/pages/download), [bundler](http://bundler.io)

This project has been setup to use [fastlane](https://fastlane.tools) to run the specs.

First, run the `setup.sh` script to bundle required gems and Cocoapods when in the project directory:

```bash
$ ./setup.sh
```

And then use fastlane to run all the specs on the command line:

```bash
$ bundle exec fastlane run_all_specs
```

## Version History

Version history can be found [on releases page](https://github.com/rbaumbach/QuickELogger/releases).

## Suggestions, requests, and feedback

Thanks for checking out QuickELogger for your logging needs.  Any feedback can be can be sent to: github@ryan.codes.
