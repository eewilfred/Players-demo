# Players-demo
An iOS Application using combine, UIKit and SwiftUI with MVVC pattern.

For folder structure please find the attached image.

As part of this project I have used,

 Player Listing Page
 -> UIkit to make the Player Listing Page
 -> All Binding is done using Combine.
 -> files inside UIKit part of the project are divided as
            - root folder ->
                    |        contaning main xib
                    |        view model
                    |       and VC file
                    |
                    -> sub view folders
                                |
                                -> constins the supporting views
                                
-> for files inside swiftUI project
        each part of the screen is diveided and added with its own View models 
        
        
All Data convertions are perfomed in Viewmodels to facilitate the core concept of MVVC

On top of MVVC:
A dedicated Flow Control
A Screen Factor
and a Service layer is added. keeping all the guidelince of MVVC

Image download is done by 2 ways:

1. using Combine and a cache , used inside UIKit
2. Using Async Image in SwiftUI. (could have used same i jsut wanted to try it out)

For any more details Please feel free to contact via email or Github.

Email: edwinwilson@ymail.com
github: https://github.com/eewilfred
                        
 
