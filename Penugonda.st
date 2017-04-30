<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® Personal Use Edition, 8.2 of July 15, 2016 on February 13, 2017 at 7:00:43 PM</time-stamp>


<component-created>
<name>CS474</name> <type>package</type>
</component-created><!-- Package CS475* -->


<component-created>
<name>CS474</name> <type>package</type>
</component-created>

<class>
<name>DoubleSet</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<class>
<name>BranchedSet</name>
<environment>Smalltalk</environment>
<super>DoubleSet</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>root </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<class>
<name>BstNode</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>data left right </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<class>
<name>Project1UI</name>
<environment>Smalltalk</environment>
<super>UI.ApplicationModel</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>setValues listArraySet listBranchSet pSet pTree </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<class>
<name>ArrayedSet</name>
<environment>Smalltalk</environment>
<super>DoubleSet</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>setX setY </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>CS474</package>
</attributes>
</class>

<methods>
<class-id>BstNode class</class-id> <category>instance creation</category>

<body package="CS474" selector="new:">new:x
	"Answer a newly created and initialized instance."

	^super new data:x.</body>
</methods>


<methods>
<class-id>BstNode</class-id> <category>accessing</category>

<body package="CS474" selector="left">left

	^left</body>

<body package="CS474" selector="data">data

	^data</body>

<body package="CS474" selector="right:">right: anObject

	right := anObject.
	^self.</body>

<body package="CS474" selector="right">right

	^right</body>

<body package="CS474" selector="left:">left: anObject

	left := anObject.
	^self.</body>

<body package="CS474" selector="data:">data: anObject

	data := anObject.
	^self</body>
</methods>

<methods>
<class-id>BstNode</class-id> <category>initialize-release</category>

<body package="CS474" selector="initialize:">initialize:value
	"Keyword expression to Initialize a newly created instance with the value passed in the argment"

	data:=value.
	
	^self</body>
</methods>


<methods>
<class-id>DoubleSet class</class-id> <category>instance creation</category>

<body package="CS474" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>DoubleSet</class-id> <category>methods</category>

<body package="CS474" selector="intersect:by:">intersect:x by:y "method which takes input arrays x &amp; y and finds the intersection between the two arrays"
|a1 a3|
a1:=x select: [:as | as ~=nil].  	"remove all the values that are nil"
a3:=y select:[:as1| as1~=nil].
^a1 select:[:a|(a3 includes: a)]  "selects only the intersection elements between both arrays"</body>

<body package="CS474" selector="union:and:">union:a2 and:a1	"To find the union of two arrays"
| a3 a4|
a3:=Array new:50.		"create a new array to store the union"
a4:=1.
a2 do:[:i| 			"Iterate over array 1"
(a3 includes: i)			"Condition to check for an already inserted elemnt into the new array"
ifFalse:[a3 at: a4 put:i. a4:=a4+1.].		"Insert non repeated element into the array"
].
a1 do:[:i| 			"Iterate over array 2"
(a3 includes: i)			"Condition to check for an already inserted elemnt into the new array"
ifFalse:[a3 at: a4 put:i. a4:=a4+1.].	"Insert non repeated element into the array"
].
^a3.</body>
</methods>

<methods>
<class-id>DoubleSet</class-id> <category>initialize-release</category>

<body package="CS474" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>


<methods>
<class-id>BranchedSet</class-id> <category>accessing</category>

<body package="CS474" selector="root">root

	^root</body>

<body package="CS474" selector="root:">root: anObject

	root := anObject</body>
</methods>

<methods>
<class-id>BranchedSet</class-id> <category>methods</category>

<body package="CS474" selector="addAllNodes:">addAllNodes: Nodes  		"Takes each input from the array and sends it to addNode to add it to the tree"
	(Nodes size) &gt; 0 	
	ifTrue: [
		Nodes do: [:i | self addNode: i]	"Calling addNode method to add it to the tree"
		]
	ifFalse: [root := nil.].					"If no elements in the array, root is nil"
	^self</body>

<body package="CS474" selector="add:at:">add: value at: pos"unusec method"</body>

<body package="CS474" selector="printAllNodes">printAllNodes
^self inOrderTraversal: root.		"to call the inordertraversal with root"</body>

<body package="CS474" selector="addNodes:at:">addNodes:num1 at:node1		"add num1 to the tree at location node1"
(node1 isNil)
ifTrue: [^BstNode new:num1]		"create a new node instance for each element inserted into the tree"
ifFalse:[
	(node1 data&lt;num1)			"check if lower than root to insert in the left part of the tree"
	ifTrue:[node1 right:(self addNodes:num1 at:node1 right). ^node1.]. "traverse to the lower part of the tree to the proper node location"
	(node1 data&gt;num1)			"check if larger than root to insert in the right part of the tree"
	ifTrue: [node1 left:(self addNodes:num1 at:node1 left). ^node1].
	^node1].</body>

<body package="CS474" selector="addNode:">addNode:num1
root:= self addNodes:num1 at:root.	"send the element to add to the tree"</body>

<body package="CS474" selector="inOrderTraversal:">inOrderTraversal: node1
|left1 right1 middle |
(node1 isNil)
ifFalse: [left1:= self inOrderTraversal:node1 left.		"traverse the left tree elements"
	middle:=node1 data printString.				"traverse the root"
	right1:=self inOrderTraversal:node1 right.].		"traverse the right tree elements"
^left1,' ',middle,' ',right1.</body>
</methods>

<methods>
<class-id>BranchedSet</class-id> <category>initialize-release</category>

<body package="CS474" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Edit the following to properly initialize instance variables ***"
	root := nil.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>


<methods>
<class-id>Project1UI class</class-id> <category>interface specs</category>

<body package="CS474" selector="windowSpec">windowSpec
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"

	&lt;resource: #canvas&gt;
	^#(#{UI.FullSpec} 
		#window: 
		#(#{UI.WindowSpec} 
			#label: 'Project1UI' 
			#bounds: #(#{Graphics.Rectangle} 315 125 966 675 ) 
			#flags: 2 ) 
		#component: 
		#(#{UI.SpecCollection} 
			#collection: #(
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.LayoutFrame} 130 0 52 0 183 0 70 0 ) 
					#name: #ActionButton1 
					#model: #arraySet 
					#label: 'ArraySet' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.LayoutFrame} 230 0 49 0 283 0 67 0 ) 
					#name: #ActionButton2 
					#model: #branchSet 
					#label: 'BranchSet' 
					#defaultable: true ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.LayoutFrame} 161 0 92 0 261 0 111 0 ) 
					#name: #InputField1 
					#model: #setValues 
					#type: #string ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.LayoutFrame} 136 0 136 0 189 0 154 0 ) 
					#name: #ActionButton3 
					#model: #switchSetYes 
					#label: 'Yes' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.LayoutFrame} 231 0 138 0 284 0 156 0 ) 
					#name: #ActionButton4 
					#model: #switchSetNo 
					#label: 'No' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.LayoutFrame} 138 0 177 0 191 0 195 0 ) 
					#name: #ActionButton5 
					#model: #setUnionYes 
					#label: 'Yes' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.LayoutFrame} 140 0 220 0 193 0 238 0 ) 
					#name: #ActionButton7 
					#model: #setIntersectYes 
					#label: 'Yes' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.LayoutFrame} 235 0 220 0 288 0 238 0 ) 
					#name: #ActionButton8 
					#model: #setIntersectNo 
					#label: 'No' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.LayoutFrame} 238 0 265 0 291 0 283 0 ) 
					#name: #ActionButton10 
					#model: #addElemNo 
					#label: 'No' 
					#defaultable: true ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.LayoutFrame} 127 0 315 0 227 0 334 0 ) 
					#name: #InputField2 
					#model: #listArraySet 
					#isReadOnly: false 
					#type: #text ) 
				#(#{UI.InputFieldSpec} 
					#layout: #(#{Graphics.LayoutFrame} 256 0 312 0 356 0 331 0 ) 
					#name: #InputField3 
					#model: #listBranchSet 
					#isReadOnly: true ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Graphics.LayoutOrigin} 17 0 54 0 ) 
					#name: #Label1 
					#label: 'New Set Creation' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Graphics.LayoutOrigin} 39 0 90 0 ) 
					#name: #Label2 
					#label: 'Set Values' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Graphics.LayoutOrigin} 40 0 135 0 ) 
					#name: #Label3 
					#label: 'Switch sets' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Graphics.LayoutOrigin} 39 0 179 0 ) 
					#name: #Label4 
					#label: 'Set Union' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Graphics.LayoutOrigin} 40 0 222 0 ) 
					#name: #Label5 
					#label: 'Set Intersect' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Graphics.LayoutOrigin} 42 0 268 0 ) 
					#name: #Label6 
					#label: 'Add Elements' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Graphics.LayoutOrigin} 43 0 318 0 ) 
					#name: #Label7 
					#label: 'List of Sets' ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.LayoutFrame} 143 0 396 0 196 0 414 0 ) 
					#name: #ActionButton11 
					#model: #copyXYes 
					#label: 'Yes' 
					#defaultable: true ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.LayoutFrame} 242 0 397 0 295 0 415 0 ) 
					#name: #ActionButton12 
					#model: #copyXNo 
					#label: 'No' 
					#defaultable: true ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Graphics.LayoutOrigin} 40 0 397 0 ) 
					#name: #Label8 
					#label: 'Copy X-&gt;Y' ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.LayoutFrame} 231 0 176 0 284 0 194 0 ) 
					#name: #ActionButton6 
					#model: #setUnionNo 
					#label: 'No' 
					#defaultable: true ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Graphics.LayoutOrigin} 154 0 343 0 ) 
					#name: #Label9 
					#label: 'AS' ) 
				#(#{UI.LabelSpec} 
					#layout: #(#{Graphics.LayoutOrigin} 293 0 342 0 ) 
					#name: #Label10 
					#label: 'BS' ) 
				#(#{UI.ActionButtonSpec} 
					#layout: #(#{Graphics.LayoutFrame} 142 0 266 0 195 0 284 0 ) 
					#name: #ActionButton9 
					#model: #addElemYes 
					#label: 'Yes' 
					#defaultable: true ) ) ) )</body>
</methods>


<methods>
<class-id>Project1UI</class-id> <category>aspects</category>

<body package="CS474" selector="listBranchSet">listBranchSet
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^listBranchSet isNil
		ifTrue:
			[listBranchSet := String new asValue]
		ifFalse:
			[listBranchSet]</body>

<body package="CS474" selector="setValues">setValues
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^setValues isNil
		ifTrue:
			[setValues := String new asValue]		"take the inputed array"
		ifFalse:
			[setValues]</body>

<body package="CS474" selector="listArraySet">listArraySet
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	^listArraySet isNil
		ifTrue:
			[listArraySet := String new asValue]
		ifFalse:
			[listArraySet]</body>
</methods>

<methods>
<class-id>Project1UI</class-id> <category>methods</category>

<body package="CS474" selector="display:arr:">display:b arr:a			"unused method- unable to delete this method"

	"This stub method was generated by UIDefiner"
  (b)
	ifTrue:[ Dialog warn: 'Array is' , a printString, ' !'.]
   	ifFalse:[Dialog warn: 'Error in array'.]</body>

<body package="CS474" selector="parse:">parse:x "unused method"
| c d f h|
d:=ReadStream on:(x setValues value).
h:=Array new:50.
f:=1.
[d atEnd]
whileFalse: [c:=Number readFrom:d. 
			h at:f put:c. 
			f:=f+1.
			 d next].
^ h select: [:e | e ~= nil].</body>

<body package="CS474" selector="parse:arrsize:">parse:x arrsize:y			"to parse the inputed text box and convert into array"
| d f w|
d:=ReadStream on:(x).		"Read stream on the input"
f:=1.
[d atEnd]
whileFalse: 
	[
	w := d upTo: Character space. "convert strings to arrray"
	w = ''
	ifFalse: [
		y at:f put:w asNumber. f:=f+1.].
	].
^ y select: [:e | e ~= nil].</body>

<body package="CS474" selector="display">display				"to display a pop up with created X array"

    Dialog warn: 'Set created with values: ' , listArraySet printString, ' !'.
	^self</body>

<body package="CS474" selector="d">d "unused method"
    | current |
    current := setValues value.
    Dialog warn: 'Current counter: ' , current printString, ' !'.
	^self</body>

<body package="CS474" selector="duplicates:">duplicates:x 	"unused method"
| a b |
a:=0.
x do:[:i| b:=x occurrencesOf: i. a:=a+b.].
(a&gt;x size)
ifTrue:[^false].
^true.</body>
</methods>

<methods>
<class-id>Project1UI</class-id> <category>actions</category>

<body package="CS474" selector="addElemNo">addElemNo

	"This stub method was generated by UIDefiner"

	^self</body>

<body package="CS474" selector="addElemYes">addElemYes

	"To add new elements to the set X"
	| a b c h f g p|
	c:=setValues value.	"take the input from set values"
	h:=Array new:50.
	b:= self parse:c arrsize:h.	"parse the input and covert it into array"
	a:=ArrayedSet new.		
	f:=a removeDuplicates: b.	"remove duplicates from the array"
	g:= a addNewNum:f  arr:pSet.	"add new elements to the array"
	p:=a toString: g.				"convert array to string"
	 Dialog warn: 'Set updated with values: ', p printString, ' !'.	
	listArraySet value: (a toString: pSet).		"write the string to the output Arrayedset tex block"
	^self</body>

<body package="CS474" selector="arraySet">arraySet		"to take the input form the setValues and send it to ArrayedSet Datastructure"
	| a b c h f|
	c:=setValues value.
	h:=Array new:50.			
	b:= self parse:c arrsize:h.		"to parse the inputed string to array"
	a:=ArrayedSet new.
	f:=a removeDuplicates: b.			"remove duplicates"
	pSet:=f.
	listArraySet value: (a toString: pSet).	"print the set X to the tex box"
	self display.					"call the pop up"</body>

<body package="CS474" selector="setIntersectNo">setIntersectNo

	"This stub method was generated by UIDefiner"

	^self</body>

<body package="CS474" selector="copyXNo">copyXNo

	"This stub method was generated by UIDefiner"

	^self</body>

<body package="CS474" selector="copyXYes">copyXYes		"copy set X into set Y and loose previous value stored in Y"
	| a |
	pTree:=pSet.	"set set Y to be X"
	a:=ArrayedSet new.
	listBranchSet value: (a toString: pTree).	"Convert it to String and display in the text box"
	^self</body>

<body package="CS474" selector="setIntersectYes">setIntersectYes		"find the intersection of set X and Y"
	| a b c d f|
	a:=DoubleSet new.
	c:=ArrayedSet new.
	b:=a intersect:pSet by:pTree.	"call the intersect function with two arrays"
	d:=b asSortedCollection.
	f:=d asArray. 				
	listBranchSet value: (c toString:f ).	"list the intersected elements into the Branchedset"
	^self</body>

<body package="CS474" selector="switchSetYes">switchSetYes	"swith X and Y with the values"

	| a c|
	c:=ArrayedSet new.	"instance of ArraySet created"
	a:=pSet.
	pSet:=pTree.		"switching of X and Y"
	pTree:=a.
	listBranchSet value: (c toString:pSet ).	"displya the switched elemtns int the text box"
	listArraySet value: (c toString:pTree ).
	^self</body>

<body package="CS474" selector="setUnionYes">setUnionYes		"finds the union of X and Y"
| a b c |
	a:=DoubleSet new.
	c:=ArrayedSet new.
	b:=a union:pSet and:pTree.	"call union method with X and Y arrays"
	listArraySet value: (c toString:b ).	"display the union array by conversted it to string"

	^self</body>

<body package="CS474" selector="switchSetNo">switchSetNo

	"This stub method was generated by UIDefiner"

	^self</body>

<body package="CS474" selector="branchSet">branchSet		"to set the elements of Y"
| a b c h f g|
	c:=setValues value.
	h:=Array new:50.
	b:= self parse:c arrsize:h.		"to parse the input and convert to array"
	a:=ArrayedSet new.
	g:=BranchedSet new.			"create an instance of branched array."
	g addAllNodes: b .
	f:=a removeDuplicates: b.		"remove"
	pTree:=f.
	listBranchSet value: (a toString: pTree).</body>

<body package="CS474" selector="setUnionNo">setUnionNo

	"This stub method was generated by UIDefiner"

	^self</body>
</methods>


<methods>
<class-id>ArrayedSet</class-id> <category>accessing</category>

<body package="CS474" selector="setX">setX

	^setX</body>

<body package="CS474" selector="setX:">setX: anObject

	setX := anObject</body>

<body package="CS474" selector="setY:">setY: anObject

	setY := anObject</body>

<body package="CS474" selector="setY">setY

	^setY</body>
</methods>

<methods>
<class-id>ArrayedSet</class-id> <category>methods</category>

<body package="CS474" selector="addNewNum:arr:">addNewNum:r arr:f  "Input the new value array to be inserted into X and the old array."
| a2  a1 a3|
a1:=f select: [:as | as ~=nil]. 	"Condition to remove nil values from the array"
a3:=r select:[:as1| as1~=nil].
a2:=a1 size+1.
a3 do:[:i| 
(a1 includes: i)				"Check for repeated values"
ifFalse:[f at: a2 put:i. a2:=a2+1.].	"Append the new array to the old array"
].
^f.</body>

<body package="CS474" selector="removeDuplicates:">removeDuplicates:v  "Input an orderedcollection and it removes all the duplicates and returns the array"
|d e|
d:=Array new:50.		"Creates a new array to store the collection"
e:=1.
v do:[:i| 
(d includes: i)			"check for repeated values"
ifFalse:[d at: e put:i. e:=e+1.].	"appeding to the new array"
].
d select: [:as | as ~=nil].
^d</body>

<body package="CS474" selector="toString:">toString:s			"To convert array to a string with spaces and returns it"
|v k|
k:=s select: [:as | as ~=nil].	"removes elements with nil from the array"
v:=(String new:100) writeStream.	"Creates a string to store the coverted array"
k do: [:i |v nextPutAll: i printString. v nextPutAll:'  '.]. "Iteratd over each array element with space"
^v contents.			"send the contentes of the stream"</body>
</methods>

<methods>
<class-id>ArrayedSet</class-id> <category>initialize-release</category>

<body package="CS474" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Edit the following to properly initialize instance variables ***"
	setX := OrderedCollection new.
	setY := nil.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>



</st-source>
