process GXA {

   input:
   path(in_vcf)

   output:
   path('GXA.vcf')

   """
   loc=`pwd`
   vep --cache --offline --format vcf --vcf --force_overwrite --input_file "\${loc}/$in_vcf" --output_file "\${loc}/GXA.vcf" -plugin GXA
   """
}