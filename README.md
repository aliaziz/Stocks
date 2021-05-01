# CashAppStocks

## Architecture 
### **The app is split in three layers.** 
1. Presentation
MVVM was my choice for presentation. It offered me more flexibility in turns of testing. I also have more familiarity with it.
I used `property wrappers` as dependency injectors for some of the properties to abstract the instatiation details. 
I had an option to go with dependency frameworks like `swinject`, though given the size of the project,  it was going to add more weight than good. 
2. Domain
I had an interface that orchestrates what the `presentation layer` should expect from the `data layer` and what the data should provide for any given `usecase`.
3. Data
I opted for `URLSession`'s shared instance due to the fact that their were no specific configurations e.g `headers, tokens etc` to be passed to the api.

### **Libraries used**
1. RxSwift. 
This is an old time favorite and given state that needed to be handled, this helped in notifying subscribers on changes in state with less configuration required.
It gave me an option to test events that occured on each `publisher` to better log and assert on results during testing.

### Trades offs
1. I traded off mocking for direct requests because of the size of the app and quantity of tests. 
2. I traded off a much better looking UI for time to be spent creating a more modular and scalable architecture.

