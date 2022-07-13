//
//  HTMLContent.swift
//  Abound
//
//  Created by Hansy Schmitt on 7/9/22.
//


var taxProfileHTML = """
<html>
    <body>
        <div id="abound-ui-wrapper"></div>
        <script type="module">
            import Abound from "https://js.withabound.com/latest/abound-client-sdk.js";

            const abound = new Abound({
                accessToken: "%@",
            });

                                            %@

            abound.renderTaxProfile({
                targetId: "abound-ui-wrapper",
                theme: customTheme,
            });
        </script>
    </body>
</html>
"""


var taxDocumentHTML = """
<html>
    <body>
        <div id="abound-ui-wrapper"></div>
        <script type="module">
            import Abound from "https://js.withabound.com/latest/abound-client-sdk.js";
            
            const abound = new Abound({
                accessToken: "%@",
            });

            %@
        
            
            abound.renderTaxDocuments({
               year: "%@",
               targetId: "abound-ui-wrapper",
               theme: customTheme,
            });
        </script>
    </body>
</html>
"""
