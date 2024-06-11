process Draw {
   
   input:
   path(in_vcf)

   output:
   path('Draw.vcf')

   """
   loc=`pwd`
   vep --cache --offline --format vcf --vcf --force_overwrite --input_file "\${loc}/$in_vcf" --output_file "\${loc}/Draw.vcf" -plugin Draw
   """
}