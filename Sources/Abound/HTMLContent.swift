//
//  HTMLContent.swift
//  Abound
//
//  Created by Abound on 7/9/22.
//


var taxProfileHTML = """
<html>
  <head>
    <meta name="viewport" content="width=device-width, user-scalable=yes" />
  </head>
  <body>
    <div id="abound-ui-wrapper"></div>
    <style>
      .abound-tax-profile {
        width: auto;
      }
      input, select{
        height:  inherit !important;
      }
    </style>
    <script>
      function onSuccess() {
        window.webkit.messageHandlers.onSuccess.postMessage("");
      }
      function onError(error) {
        window.webkit.messageHandlers.onError.postMessage(error);
      }
    </script>
    <script type="module">
      import Abound from "https://js.withabound.com/latest/abound-client-sdk.js";
      // debug mode
      %@
      // Access Token
      const abound = new Abound({
        accessToken: "%@",
      });
      // Theme
      %@
      // Custom Content
      %@
      function onSuccessOrError (){
                      if(debugMode){
                          const eins = document.getElementsByName("ein")
                          if(eins.length>0){
                              const ein = eins[0].value.replace("-","");
                              switch(ein){
                                  case "999999999":
                                      onError("unverified");
                                  break;
                                  case "333333333":
                                      onError("mismatch");
                                  break;
                                  case "111111111":
                                      onError("error");
                                  break;
                                  case "555555555":
                                      onError("lockedOut");
                                  break;
                                  default:
                                      onSuccess();
                              }
                          }
                      }else{
                          onSuccess();
                      }
                    
                  }
      abound.renderTaxProfile({
        targetId: "abound-ui-wrapper",
        theme: customTheme,
        onSubmitSuccess: onSuccessOrError,
        onSubmitError: onError,
        content: customContent,
      });
    </script>
  </body>
</html>
"""


var taxDocumentHTML = """
<html>
  <head>
    <meta name="viewport" content="width=device-width, user-scalable=yes" />
  </head>
    <body>
        <style>
            .abound-tax-documents {
                width: auto;
            }
            input, select{
                height:  inherit !important;
            }
        </style>
        <div id="abound-ui-wrapper"></div>
    <script>
      function onSuccess() {
        window.webkit.messageHandlers.onSuccess.postMessage("");
      }
      function onError(error) {
        window.webkit.messageHandlers.onError.postMessage(error);
      }
    </script>
        <script type="module">
            import Abound from "https://js.withabound.com/latest/abound-client-sdk.js";
            // debug mode
            %@
            // Access Token
            const abound = new Abound({
                accessToken: "%@",
            });
            // Theme
            %@
            // Custom Content
            %@
            //Year
            abound.renderTaxDocuments({
               year: "%@",
               targetId: "abound-ui-wrapper",
               theme: customTheme,
               onSubmitError: onError,
               onSubmitSuccess: onSuccess,
            });
        </script>
    </body>
</html>
"""
