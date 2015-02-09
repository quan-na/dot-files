import XMonad
import XMonad.Hooks.DynamicLog
import Data.Monoid
import System.Exit

main = xmonad =<< xmobar defaultConfig {
    focusFollowsMouse = True
    , borderWidth = 1
    , normalBorderColor = "#00BFFF"
    , focusedBorderColor = "#6AFB92"
}
