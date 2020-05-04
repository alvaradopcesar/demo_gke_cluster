package main

import (
	"math"
	"os"
	"strconv"

	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
)

type Greetings struct {
	Message string `json:"message"`
}

func greetings(c echo.Context) error {
	hostname := "."
	env, found := os.LookupEnv("HOSTNAME")
	if found {
		hostname = env
	}
	return c.JSON(200, Greetings{
		Message: "Hola world from " + hostname,
	})
}

type Square struct {
	Number float64 `json:"number"`
	Square float64 `json:"square"`
}

func square(c echo.Context) error {
	number, err := strconv.ParseFloat(c.Param("number"), 64)
	if err != nil {
		return c.JSON(500, err)
	}
	return c.JSON(200, Square{
		Number: number,
		Square: math.Sqrt(number),
	})
}

func main() {
	e := echo.New()
	e.Use(middleware.CORS())

	e.GET("/greetings", greetings)
	e.GET("/square/:number", square)

	e.Start(":80")
}
