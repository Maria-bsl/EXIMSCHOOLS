<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CC.aspx.cs" Inherits="Schools.CC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script
      src="https://ap-gateway.mastercard.com/checkout/version/57/checkout.js"
      data-error="errorCallback"
      data-cancel="http://183.83.33.156:81/check.html"
      
    ></script>

    <script type="text/javascript">
        reference = () => {
            return "ORDER123" + Math.floor(Math.random() * 1000 + 1 + 8);
        };

        function errorCallback(error) {
            console.log(JSON.stringify(error));
        }
        function completeCallback() {
            alert("Finished");
            console.log("Payment Received");
        }

        function cancelCallback() {
            console.log("Payment cancelled");
        }

        Checkout.configure({
            session: { 
                id: '<%= sessid %>'
            },
            merchant: "TESTMBL",
            order: {
                amount: <%= amount %>,
                currency: "TZS",
                description: "Ordered goods",
                id: reference(),
                // callbackUrl: "http://183.83.33.156:81/Default.aspx",
                reference: reference(),
            },
            interaction: {
                operation: "PURCHASE",
                merchant: {
                    name: "Test Payment:",
                    address: {
                        line1: "200 Sample St",
                        line2: "1234 Example Town",
                    },
                },
            },
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input
      type="button"
      value="Pay with Lightbox"
      onclick="Checkout.showLightbox();"
    />
    <input
      type="button"
      value="Pay with Payment Page"
      onclick="Checkout.showPaymentPage();"
    />
    </div>
    </form>
</body>
</html>
