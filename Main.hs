{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import Data.Text.Lazy

main = scotty 3000 $ do
  get "/"           routeHome
  get "/foo"        routeFoo
  get "/echo/:word" routeEcho



routeHome = html "Home base"

routeFoo = html "You've hit /foo"

routeEcho = do
  word <- param "word" :: ActionM String
  html $ pack $ "Echoing " ++ show word
