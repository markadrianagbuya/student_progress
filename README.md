# Student Progress App

This app is a Rails application that allows a teacher to monitor their students' progress.

## Specification Assumptions

* Part 1
  * The routes do not require authentication or authorisation.
* Part 1(a)
  * A student can be set with any part number or lesson number.
    * In Part 3 it is said that students are only able to proceed to the next lesson/part. Perhaps this route is used to set a starting progress.
  * A student already exists at this point - It seems reasonable to set the progress of an existing student, rather than for a student that doesn’t exist.
  * This route does not require any response as it was not specified in the specification
* Part 1(b)
  * The JSON response does not need to be formatted in a particular way - I decided to omit this detail until a particular format was specified.
* Part 2(a)
  * I could have related teachers directly to students as specified. However, given the domain knowledge "Teachers have classes containing number of students”. I decided it was reasonable to model this domain and include classes or “classrooms”.
  * It does not specify whether students belong to multiple classes. So currently students can be in a single class.
* Part 2(b)
  * Report page does not require any authentication or authorisation. A teacher can view the progress of all of their students by entering a specific url
* Part 3
  * I assumed that a simple ruby method was required. It does not include an interface or route that links to this.
  * I assumed the method didn’t take any parameters and merely updated the progress of the student to the next lesson or part. I think it’s reasonable because there is only one progression update that would be valid for the student. It would be redundant to specify a lesson number or part number.

## Model/Domain Reasoning

* Progression model
  * Multiple records to represent progression. This would allow users to start at any point and means that all actual completed parts could be accurately represented.
  * I contemplated using a PartCompletion class as this would more accurately represent the idea above. However I decided to leave it as progression as it more closely resembled the repeated idea of “Progress"
  * I also contemplated using a progress model that was updated. However it seemed grammatically odd for a student to have a progress. Also, if the lesson sequence changed (e.g. having 4 parts instead of 3) the representation of progress would be inaccurate.

* Lesson sequence & progression.next
  * Currently there are 100 lessons and each lesson has 3 parts - 1, 2 and 3. The lessons are completed sequentially. Rather than implement some mathematical logic to compute the next lesson or part, I find the next lesson/part in the sequence. This means that if the lesson structure or sequence changes, only the array (LESSON_SEQUENCE) needs to be updated.


## Reflection:

* The challenging parts of this project were mainly the domain and understanding the context in which the features were used. With more time I would have clarified a few of the assumptions I had to make.
* TDD helped a lot with this challenge as it allowed me to focus on what to work on next and break the problem down into smaller chunks.
* Overall, I'm happy with the solution. I learnt a lot from this challenge and I hope the code quality is enough to be considered for further stages of this interview process.
