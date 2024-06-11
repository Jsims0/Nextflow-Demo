process CompileVCF {

   publishDir "${params.outdir}", mode: "copy"

   input:
   path '*.vcf'
   path 'input.vcf.gz'

   output:
   path 'final.vcf.gz'

   //recreate VCF using original header plus any extra info fields created by plugins
   //some plugins only update the "latest command" header line, I omitted that due to no additional info provided and is complex
   """
   zcat input.vcf.gz | grep -e '^##' > final.vcf
   grep -e '^##INFO=<ID=CSQ' *.vcf | uniq | cut -f 2 -d : | uniq >> final.vcf
   grep -e '^##CAROL' *.vcf | uniq | cut -f 2 -d : | uniq >> final.vcf
   grep -e '^##LOVD' *.vcf | uniq | cut -f 2 -d : | uniq >> final.vcf
   grep -e '^##NMD' *.vcf | uniq | cut -f 2 -d : | uniq >> final.vcf
   grep -e '^##NearestGene' *.vcf | uniq | cut -f 2 -d : | uniq >> final.vcf
   zcat input.vcf.gz | grep -e '^#CHROM' >> final.vcf
   tail -n 1 *.vcf | grep -v '==>' | grep -e '^.' >> final.vcf
   gzip final.vcf
   """
}