# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def general_pods
  pod 'RxSwift', '6.1.0'
  pod 'RxCocoa', '6.1.0'
end

target 'CashAppStocks' do
  general_pods
  use_frameworks!


  target 'CashAppStocksTests' do
    inherit! :search_paths
    
    pod 'RxBlocking', '6.1.0'
    pod 'RxTest', '6.1.0'
  end

end

target 'StocksDataModule' do
  use_frameworks!
  general_pods
end

target 'StocksDomainModule' do
  use_frameworks!
  general_pods

end
