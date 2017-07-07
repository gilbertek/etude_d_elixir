alias Tik.{Stock, Portfolio}

msft = %Stock{ticker: "MSFT"}
appl = %Stock{ticker: "APPL"}

Portfolio.add(msft)
Portfolio.add(appl)
