package token

import (
	"time"
)

// Maker is an interface to manage tokens
type Maker interface {
	CreateToken(username string, duration time.Duration) (string, *Payload, error)

	VerifyToken(token string) (*Payload, error)
}
