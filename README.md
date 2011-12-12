SurveyBug
=========

A simple survey generator and administrator.

Requirements:
-------------

Same as requirements for Rails 3.0.11 - Ruby 1.9.2 is preferred, but 1.8.7+ works.

Run `rails server` to start.

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
2. Results from surveys taken before a survey is changed or edited are only consistent with the survey's state at the time of taking (i.e. they do not need to include any new questions added since the result was created).

Status:
--------

12/12/2011
---------

Done:

* All simple data model operations are complete (Create, List, View, Edit Surveys, List/view Results, etc.)
* Simple clean graphical layout.
* AJAX-based submission of Survey changes.
* Javascript-based dynamic editing of Surveys
* Saving surveys and reloading them for future edits.
* Form for taking saved surveys, including a URL to send to friends.
* Viewing survey results in list and individual format, including a listing of answers to questions.

ToDo:

* Unit tests for some critical sections.
* More graphical elements and styling (better iconography, better shading, etc.)
