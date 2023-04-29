Feature: Invoice details
	# https://automation-sandbox-python-mpywqjbdza-uc.a.run.app

	# OBS.: Casas decimais

	Background:
		Given the main page loaded
		When the following field Email: "demouser"
		And the following field Password: "abc123"
		And the click the button Login
		Then the application show the page Invoice List

	Scenario: TC001 - Validate invoice details
		Given to click the Invoice Details link for the first item presented in the screen
		When the application shows the informations of the Invoice
		And validation the Hotel Name: "Rendezvous Hotel"
		And validation the Invoice Date: "14/01/2018"
		And validation the Due Date: "15/01/2018"
		And validation the Invoice Number: "110"
		And validation the Booking Code: "0875"
		And validation the Customer Details: "JOHNY SMITH R2, AVENUE DU MAROC 123456"
		And validation the Room:"Superior Double"
		And validation the Check In: "14/01/2018"
		And validation the Check Out: "15/01/2018"
		And validation the Total Stay Count: "1"
		And validation the Total Stay Amount: "$150"
		And validation the Deposit Now: "USD $20.90"
		And validation the Tax & VAT: "USD $19.00"
		And validation the Total Amount: "USD $209.00"
