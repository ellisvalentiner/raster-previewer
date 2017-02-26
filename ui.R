fluidPage(
	titlePanel("Image output"),

	fluidRow(
		column(4, wellPanel(
			selectInput("rast",
			            label = "Choose date",
			            choices = c("July 23, 2016" = "rasters/20160723_192300_1057923_RapidEye-4/20160723_192300_1057923_RapidEye-4_analytic.tif",
			                        "August 2, 2016" = "rasters/20160802_193214_1057923_RapidEye-4/20160802_193214_1057923_RapidEye-4_analytic.tif")),
			fileInput('custom_rast', 'Upload GeoTIFF', accept=c('image/tif', 'image/tiff', 'tif', 'tiff')),
			selectInput("bands",
			            label = "Choose colorization",
			            choices = c("True color composite" = "true",
			                        "False color composite" = "false")),
			selectInput("stretch",
			            label = "Choose stretch method",
			            choices = c("Linear" = "lin",
			                        "Histogram" = "hist",
			                        "None" = NULL))
			)),
		column(4,
			imageOutput("preview"))
		)
	)
