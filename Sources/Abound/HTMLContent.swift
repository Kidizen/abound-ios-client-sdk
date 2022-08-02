//
//  HTMLContent.swift
//  Abound
//
//  Created by Abound on 7/9/22.
//


var taxProfileHTML = """
<html>
  <body>
    <div id="abound-ui-wrapper"></div>
    <style>
      .abound-tax-profile {
        width: auto;
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
      // Access Token
      const abound = new Abound({
        accessToken: "%@",
      });
      // Theme
      %@
      // Custom Content
      %@
      abound.renderTaxProfile({
        targetId: "abound-ui-wrapper",
        theme: customTheme,
        onSubmitSuccess: onSuccess,
        onSubmitError: onError,
        content: customContent,
      });
    </script>
  </body>
</html>
"""


var taxDocumentHTML = """
<html>
    <body>
        <style>
            .abound-tax-documents {
                width: auto;
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
