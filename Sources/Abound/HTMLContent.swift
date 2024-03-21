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
        window.webkit.messageHandlers.onError.postMessage(error.toString());
      }
    </script>
    <script type="module">
      import { renderW9Collection } from "https://js.withabound.com/latest-v2-minor/abound-client-sdk.js";
      // Theme
      %@
      // Custom Content
      %@
      renderW9Collection({
        accessToken: "%@",
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
            import { renderTaxDocuments } from "https://js.withabound.com/latest-v2-minor/abound-client-sdk.js";
            // Theme
            %@
            // Custom Content
            %@
            //Year
            renderTaxDocuments({
               accessToken: "%@",
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
