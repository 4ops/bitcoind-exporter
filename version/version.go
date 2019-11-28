package version

import (
	"fmt"
	"runtime"
)

// GitCommit is ...
var GitCommit string

// Version is ...
const Version = "0.0.0"

// BuildDate is ...
var BuildDate = ""

// GoVersion is ...
var GoVersion = runtime.Version()

// OsArch is ...
var OsArch = fmt.Sprintf("%s %s", runtime.GOOS, runtime.GOARCH)
