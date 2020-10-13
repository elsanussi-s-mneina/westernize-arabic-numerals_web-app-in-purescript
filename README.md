# Westernize Numerals Web Application

Converts numerals to 0123456789 (as used in Europe) from versions used in
parts of the Middle East, and India.


For example:
٠١٢٣٤٥٦٧٨٩
becomes 0123456789.

And 
૦૧૨૩૪૫૬૭૮૯
becomes 0123456789.

And so on.

# Developer Requirements
 - Purescript compiler (purs version 0.13.8)
   - with Spago version 0.16.0 (a build system for Purescript)
 - A web browser

# How to check version numbers
At the terminal, enter: 
`$ purs --version`

Expect:

`0.13.8`

At the terminal, enter: 
`$ spago version`

Expect:
`0.16.0`

# How to make the web page
Run the following command
```
$ spago bundle-app
```

You should now have a Javascript file in the current directory. 
Now open index.html.
It should provide the interaction for a button in the HTML file "index.html".


# How this project was started
`spago init`

`spago install strings`

`spago install spec`

# How to make the Javascript Module
spago build

# How to run the tests
spago test

## About the Developer of this Numeral Westernizer Application
www.linkedin.com/in/elsanussi-mneina-57a8181b5

https://github.com/elsanussi-s-mneina
