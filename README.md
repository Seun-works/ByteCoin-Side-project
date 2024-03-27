# Byte Coin 

Byte Coin is a side project I worked on while upskilling on swift and its interfaces. It's one of the projects I did on my own while trying to figure out how to interact with an api and respond to its returned object. The app connects to the coin api defined in https://www.coinapi.io/.
This displays the rate of Bitcoins in various currencies.

## Concepts used

- I followed the MVC design pattern in order to establish a clean codebase by seperating the codebase into the Model, View and Controller.
- This project also shows that I have a good understandig of handling api calls and also following the delegate and protocol design pattern used to pass data from an api call to be displayed in the view. This is shown here with how the respective methods were created: https://github.com/Seun-works/ByteCoin-Side-project/blob/305242d82548964bfab46bf84597cbb83ab91844/ByteCoin/Model/CoinManager.swift#L7-L53?plain=1
- I also practiced the compartmentalizing of the controller by making use of the `extension` keyword to seperate the `ViewController` into different extensions that inherit from a protocol or a super class.

### Output
- Video of the app being used in the emulator:

https://github.com/Seun-works/ByteCoin-Side-project/assets/85084342/358e3d5d-374a-4256-8f94-404e85eb6f66

