import UIKit
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var dataStoreConfigurator: DataStoreConfigurator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        dataStoreConfigurator = CoreDataConfigurator()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        
        //since the actual view controller we want to show is going to happen async
        //we make a copy of the launch screen storyboard and use it as temporary root view controller
        let splashCopy = UIStoryboard(name: "LaunchScreen", bundle: nil)
        let vc = splashCopy.instantiateViewController(withIdentifier: "LaunchScreen")
        self.window?.rootViewController = vc

        //only start the app once we are finished setting up our data store (Core Data in this case)
        dataStoreConfigurator?.initDataStore({
            self.window?.rootViewController = RootModuleFactory.buildModule()
        })
        
        return true
    }

}
