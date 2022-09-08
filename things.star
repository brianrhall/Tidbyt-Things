load("render.star", "render")
load("encoding/base64.star", "base64")

THINGS_IMG = base64.decode("""iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAdZJREFUOE9jZKAQMCLrt2z69J8Y847X8cH1wRlWzZ//MzAyMtw8thSvGVrW0Qx///1nOFbLC9YLN8C29cv/S1ubGU4vLUIxgJmZGc7/+/cvg2lYN4O2Xz2mAQ4dX/+fWZHP8ObkdAYmJhSfwQ349+8/g4h5JoNZWNf/fVVCTCgucO789v/k8jyGT+dmg3yCAfTNHRgunDjAwKsXx2ARO5NhbzkXqhfcen78P7ogleHzpUUYBpjZezCcOriD4f9/BrAB1gmzGXaVcKAa4Nn38/+heSlwA+zcAxgO7dzAAKNBToIZ4JI0iWFjkSCqAd4Tfv0/MCcZxQWufuEMttaODHXlGWAvgQzg0Q5ncExfwrC1gA3VAP9Jv//vnh7N8OXqSqxhgGyAa+ZSho15rKgGBE39A05Ea7MQ0YYtQQRP+wsWXpfNgmqAuO+K/xaO7gys7HxgBZYMy1H0H2eIBPP//f3BcHT3ZoaXmyNQDRDzmPP/z9fXEE2MDAz5XgIMHFycYO6Pb98ZJu38wgCLeFYBZYZn64JQDWBgYOAQsm3/DjPAzicOxQWHty+DG/B6X6kAAwPDR5SEBFXNzynnOJld0jwWm/9/v7tx8OvtDf4wzdgMwJuRsEkCAKJkoxFlS5fSAAAAAElFTkSuQmCC""")

THINGS_IMG_NONE = base64.decode("""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""")


def main():

    # set colors
    white_color="#FFFFFF" # white

    toDo1 = "Item 1"
    toDo2 = "Item 2"
    toDo3 = ""
    

    if toDo1 == "":
	return render.Root(
	child = render.Box(
            render.Row(
                expanded=True,
                main_align="space_evenly",
                cross_align="center",
                children = [
                    render.Image(src=THINGS_IMG_NONE)
                ],
            ),
        ),
    )
    elif toDo2 == "":
	if len(toDo1) > 30:
		toDo1 = toDo1[0:30] + "-"

	return render.Root(
	child = render.Column(
	    expanded=True,
            main_align="space_evenly",
            children = [
		render.Row(
			expanded=True,
			main_align="space_evenly",
			cross_align="center",
                		children = [
                    		render.Image(src=THINGS_IMG)
                		],
            	),
	    	render.Row(
                		expanded=True,
                		main_align="space_evenly",
                		cross_align="center",
                		children = [
				render.WrappedText(str(toDo1), color=white_color, font="tom-thumb"),
                		],
            	),
	],
	),
    )	
    elif toDo3 == "":
	if len(toDo1) > 13:
		toDo1 = toDo1[0:13] + "-"
	if len(toDo2) > 13:
		toDo2 = toDo2[0:13] + "-"

	return render.Root(
	child = render.Column(
	    expanded=True,
            main_align="space_evenly",
            children = [
		render.Row(
			expanded=True,
			main_align="space_evenly",
			cross_align="center",
                		children = [
                    		render.Image(src=THINGS_IMG)
                		],
            	),
	    	render.Row(
                		expanded=True,
                		main_align="space_evenly",
                		cross_align="center",
			children = [
                			render.Column(
                      			main_align="center",
                      			cross_align="start",
                      			expanded=True,
                      			children=[
                        				render.Text("-"+str(toDo1), color=white_color, font="tom-thumb"),
                        				render.Text("-"+str(toDo2), color=white_color, font="tom-thumb"),
                      			],
                    		),
			],
            	),
	],
	),
    )	
    else:

	if len(toDo1) > 10:
		toDo1 = toDo1[0:10] + "-"
	if len(toDo2) > 10:
		toDo2 = toDo2[0:10] + "-"
	if len(toDo3) > 10:
		toDo3 = toDo3[0:10] + "-"
    return render.Root(
        child = render.Column(
          children=[
            render.Row(
                main_align="start", # horizontal alignment
                cross_align="center", # vertical alignment
                expanded=True,
                children = [
                    render.Image(src=THINGS_IMG, width=16, height=16),
                    render.Column(
                      main_align="center",
                      cross_align="start",
                      expanded=True,
                      children=[
                        render.Text("-"+str(toDo1), color=white_color, font="tom-thumb"),
                        render.Text("-"+str(toDo2), color=white_color, font="tom-thumb"),
                        render.Text("-"+str(toDo3), color=white_color, font="tom-thumb"),
                      ],
                    ),

                ],
            ),
          ],
        ),
    )
