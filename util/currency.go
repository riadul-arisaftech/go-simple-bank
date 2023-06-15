package util

// "EUR", "USD", "CAD", "BDT"
const (
	USD = "USD"
	EUR = "EUR"
	CAD = "CAD"
	BDT = "BDT"
)

func IsSupportedCurrency(currency string) bool {
	switch currency {
	case USD, EUR, CAD, BDT:
		return true
	}
	return false
}
