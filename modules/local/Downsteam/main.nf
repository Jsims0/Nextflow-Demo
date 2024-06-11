process Downstream {

   input:
   path(in_vcf)

   output:
   path('Downstream.vcf')

   """
   loc=`pwd`
   vep --cache --offline --format vcf --vcf --force_overwrite --input_file "\${loc}/$in_vcf" --output_file "\${loc}/Downstream.vcf" -plugin Downstream
   """
}