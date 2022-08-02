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
            
            function onSuccess(){
               
                    window.webkit.messageHandlers.onSuccess.postMessage("");
                
            }
            function onError(){
                alert("OnError");
            }
            //Year
            abound.renderTaxProfile({
                targetId: "abound-ui-wrapper",
                theme: customTheme,
                onSuccess: onSuccess,
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
            function onSuccess(){
                alert("OnSuccess");
            }
            function onError(){
                alert("OnError");
            }
            //Year
            abound.renderTaxDocuments({
               year: "%@",
               targetId: "abound-ui-wrapper",
               theme: customTheme,
               onSubmitError: onError,
               onSuccess: onSuccess,
            });
        </script>
    </body>
</html>
"""
