import XMonad

myTerminal = "alacritty"

myModMask  = mod4Mask
myBorderWidth = 2

main = do
  xmonad $ def
    { terminal       = myTerminal
    , modMask        = myModMask
    , borderWidth    = myBorderWidth
    }

