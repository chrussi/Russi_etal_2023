library(jagsUI)

#load data
load('data.Rdata')

# params to monitor
params=c('lambda.p','det.p','det.b','p.bar',
         'lambda.b','lambda.b0','a.spt','sigma.spt','N')

# MCMC settings
ni <- 200000 ; nt <- 30 ; nb <- ni*.2 ; nc <- 3

out <- jagsUI::jags(data = jags.data,parameters.to.save = params,inits = inits,
                    model.file = "model code.txt",
                    n.chains = nc, n.thin = nt, n.iter = ni,n.burnin = nb)

jagsUI::jags.View(out)
sm=round(out$summary,3)
save.image("MNM.Rdata")

# CHECK MODEL CONVERGENCE
traceplot(out,'a1[1]')
