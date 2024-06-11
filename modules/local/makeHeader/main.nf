process makeHeader {
	
   input:
   each item

   """
   echo $item >> header.txt
   """
}