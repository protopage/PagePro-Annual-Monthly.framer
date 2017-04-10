#Document Setup
document.body.style.cursor = "auto"
Framer.Extras.Hints.disable()
Framer.Extras.ShareInfo.disable()
Framer.Extras.Preloader.enable()
# Sketch
sketch = Framer.Importer.load("imported/PagePro_NewPricing_Annual-Monthly@1x")
{annualMonthlyToggle, annual, monthly, meowmix} = sketch
#Scroll
scroll = ScrollComponent.wrap(meowmix)
scroll.scrollVertical = true
scroll.scrollHorizontal = false
scroll.mouseWheelEnabled = true
scroll.width = document.documentElement.clientWidth
scroll.height = document.documentElement.clientHeight
scroll.content.draggable = false

# Make a scroll bar
# ------------------------------------------------------------
	
scrollBar = new Layer
	x: Align.right
	width: 24
	height: Screen.height * (Screen.height / scroll.content.height)
	backgroundColor: ""

scrollBarShape = new Layer
	parent: scrollBar
	x: 8
	y: 8
	width: scrollBar.width - 16
	height: scrollBar.height - 16
	backgroundColor: "#8A8A8A"
	borderRadius: 100


# Move scroll bar on scroll
# ------------------------------------------------------------

scroll.onMove ->
	progress = scroll.scrollY / (scroll.content.height - scroll.height)
	scrollBar.y = progress * (Screen.height - scrollBar.height)


# Make scroll bar draggable
# ------------------------------------------------------------

scrollBar.draggable.enabled = true
scrollBar.draggable.horizontal = false
scrollBar.draggable.constraints =
	height: Screen.height

scrollBar.onDrag ->
	progress = scrollBar.y / (Screen.height - scrollBar.height)
	scroll.scrollY = progress * (scroll.content.height - scroll.height)


Canvas.onResize ->
	scroll.size = Canvas.size
	scrollBar.x = Align.right


meowmix.x = Align.center

monthly.visible = false
annual.visible = true

annualMonthlyToggle.onClick ->
	if annual.visible is true
		monthly.visible = true
		annual.visible = false
	else
		annual.visible = true
		monthly.visible = false