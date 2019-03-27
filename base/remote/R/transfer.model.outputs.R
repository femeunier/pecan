##-------------------------------------------------------------------------------
## Copyright (c) 2012 University of Illinois, NCSA.  All rights reserved. This
## program and the accompanying materials are made available under the terms of
## the University of Illinois/NCSA Open Source License which accompanies this
## distribution, and is available at
## http://opensource.ncsa.illinois.edu/license.html
##-------------------------------------------------------------------------------

##' Transfer selected ecosystem model runs within PEcAn workflow from remote
##' assuming they are all finished
##'
##' @param settings pecan settings object
##' @export transfer.model.outputs
##' @examples
##' \dontrun{
##'   transfer.model.outputs(settings)
##' }
##' @author Félicien Meunier
##'

transfer.model.outputs <-function(settings){
  run_file <- file.path(settings$rundir, "runs.txt")
  if (!file.exists(file.path(settings$rundir, "runs.txt"))) {
    PEcAn.logger::logger.warn("runs.txt not found, assuming no runs need to be transferred")
    return()
  }
  run_list <- readLines(con = run_file)
  nruns <- length(run_list)
  
  is_local <- is.localhost(settings$host)
  
  for (run in run_list) {
    run_id_string <- format(run, scientific = FALSE)
    
    if (!is_local) {
      PEcAn.remote::remote.copy.from(host = settings$host, 
                                     src = file.path(settings$host$outdir, run_id_string), 
                                     dst = settings$modeloutdir)
    }
  }
  
}