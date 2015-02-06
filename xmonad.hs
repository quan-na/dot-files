import XMonad
import XMonad.Hooks.DynamicLog
import Data.Monoid
import System.Exit

main = xmonad =<< xmobar defaultConfig {
    focusFollowsMouse = True
    , borderWidth = 2
    , modMask = mod3Mask
    , normalBorderColor = "#00BFFF"
    , focusedBorderColor = "#6AFB92"
}
