library(terra)

# Load band
st_clip <- "D:/SPATIAL DATA/LC_B10.tif"
ST_B10 <- rast(st_clip)

# Scale and offset (Landsat 8/9 Band 10)
scale  <- 0.00341802
offset <- 149.0

# Convert to Celsius
LST_C <- (ST_B10 * scale + offset) - 273.15
LST_C[LST_C < -50 | LST_C > 80] <- NA

# Color palette
pal <- colorRampPalette(c("blue", "cyan", "yellow", "orange", "red"))

# Plot LST
plot(LST_C,
     col = pal(100),
     main = "Land Surface Temperature",
     sub  = "Cigugur Sub-district, Kuningan Regency, West Java",
     plg  = list(title = "°C"))

# Add grid
grid(col = "gray40", lty = 2)




