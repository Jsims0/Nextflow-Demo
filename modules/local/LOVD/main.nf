process LOVD { 

   input:
   path(in_vcf)

   output:
   path('LOVD.vcf')

   """
   loc=`pwd`
   vep --cache --offline --format vcf --vcf --force_overwrite --input_file "\${loc}/$in_vcf" --output_file "\${loc}/LOVD.vcf" -plugin LOVD
   """
}