SurveyBug
=========

A simple survey generator and administrator.

Specifications:
---------------

1. Support one question type (Radio question type) and optionally checkboxes.
2. Use Javascript and ajax where possible for a more dynamic user experience.
3. A user can take a survey and there should be a page to see results.

Sample survey:
--------------

Title: My first survey

	1. What is your gender?
		(  ) Male
		(  ) Female

	2. What are your favorite color(s)?
		[  ] Red
		[  ] Blue
		[  ] Pink
		[  ] Green

	[Submit]

Assumptions:
------------

1. User accounts are not required; a user will simply enter a name to identify themselves when taking a survey.
2. Results from surveys taken before a survey is changed or edited are not promised to be consistent with the format or content of the latest survey.
3. General focus is on the UI and front-end abilities for editing and taking surveys. Results viewing and admin tasks are less important.

Status:
--------

12/9/2011
---------

Done:

* All simple data model operations are complete (Create, List, View, Edit Surveys, List/view Results, etc.)
* Simple clean graphical layout.
* AJAX-based submission of Survey changes.
* Javascript-based dynamic editing of Surveys (Note: Does not yet save)

ToDo:

* Saving the actual Survey form the user creates using the editor.
* Taking surveys: generate a form based on the Survey Question and Option structure, and store results.
* Unit tests for the above (for question and option saving, and handling new survey results)
* More graphical elements (better iconography, better shading, etc.)
* (Minor) Figure out how to commit the results of the Survey Editor from the New page as well (currently simple New page directs to the Edit page, where you can then add questions).
* (Minor) It may not be obvious that Survey questions and options are draggable for reordering. Provide imagery to clarify.
