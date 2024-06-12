
include { CCDSFilter } from './modules/local/CCDSFilter' // filter vcf
include { CSN } from './modules/local/CSN'   // annotate clinical sequencing nominclature
include { Carol } from './modules/local/Carol' //annotate CARLOL score
include { Downstream } from './modules/local/Downstream' // downstream AA effect predictor
include { Draw } from './modules/local/Draw' // draw transcript model
include { GXA } from './modules/local/GXA' //  gene expression atlas data
include { LOVD } from './modules/local/LOVD' // LOVD variation data
include { NMD } from './modules/local/NMD' // predict nonsense-mediated mRNA decay escape
include { NearestGene } from './modules/local/NearestGene' // finds nearest gene to variant
include { AncestralAllele } from './modules/local/AncestralAllele' // retrive ancestral allele
include { makeHeader } from './modules/local/makeHeader' // attach header
include { CompileVCF } from './modules/local/CompileVCF' // recreate vcf


workflow {
   input_vcf = Channel.fromPath(params.input)
   //splits input vcf into a string of each line, split converts this to a map of each line then to toList converts it to the expected list type for future operators
   input_vcf.splitText( decompress:true ) { it.split().toList() } 
   //using the logic of how vcf files are built, put all header information into one channel and all genomic regions into another
	    .branch {
		header: it.first() =~ '#' 
		body: it.first() !=~ '#'
	     }
	    .set { processed_vcf }
   CCDSFilter(processed_vcf.body) | CSN | Carol | Downstream | Draw | GXA | LOVD | NMD | NearestGene | AncestralAllele
   CompileVCF(AncestralAllele.out.vcf.collect(), input_vcf)
}