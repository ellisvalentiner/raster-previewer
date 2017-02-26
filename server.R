library(raster)

options(shiny.maxRequestSize=300*1024^2) 

NDVI <- function(x) {
  y <- (x[,3]-x[,5])/(x[,3]+x[,5])
  
}


function(input, output, session){
	output$preview <- renderImage({
		
		outfile <- tempfile(fileext = ".png")
		input$custom_rast

		if (!is.null(input$custom_rast)){
			brick <- brick(input$custom_rast$datapath)
		} else {
			brick <- brick(input$rast)			
		}
		if(input$bands == "true"){
		  r <- 3
		  g <- 2
		  b <- 1
		} else if(input$bands == "false"){
		  r <- 5
		  g <- 3
		  b <- 2
		} else if(input$bands == "ndvi"){
		  ndvi <- calc(brick, NDVI)
		  brick <- addLayer(brick, ndvi)
		  r <- 5
		  g <- 7
		  b <- 2
		}
		png(outfile, width = min(brick@ncols, 700), height = min(brick@nrows, 700))
		plotRGB(brick, r = r, g = g, b = b, stretch = input$stretch)
		dev.off()

		# Return list with image metadata
		list(src = outfile,
			contentType = "image/png",
			width = min(brick@ncols, 700),
			height = min(brick@nrows, 700),
			alt = "image preview")

		}, deleteFile = TRUE)
}
