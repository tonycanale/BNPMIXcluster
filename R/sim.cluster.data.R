#'
#' @docType data
#'
#' @name
#'     sim.cluster.data
#'
#' @title
#'     Simulated data for testing the \emph{BNPMIXcluster} package
#'
#' @description
#'     Simulated values for three continuos variables under the existence of three clusters.
#'
#'     The data consists of a three-variate Normal distribution with different mean and covariance matrix between clusters.
#'
#'     This can be assumed either as continuos data to be clustered Y=(Y_1,Y_2,Y_3); or also can be used as the underlying latent data that can be transformed into observable variables Y_i=f(Z_i), which can be continuos or categorical.
#'
#' @usage
#'     sim.cluster.data
#'
#' @format
#'     A data frame with 100 rows and 4 variables.
#'     \describe{
#'         \item{cluster}{Indicates the cluster for each row}
#'         \item{Z1,Z2,Z3}{Continuos values coming from a multivariate normal distribution, given the cluster}
#'     }
#'
#' @details
#'     A data frame with 100 rows and 4 variables.
#'
#' @examples
#'
#' ### Visualizing the simulated data for clustering ###
#'
#' require(scatterplot3d)
#'
#' cluster_color <- c(rgb(1,0,0,alpha = 0.5),
#'                    rgb(0,0,1,alpha = 0.5),
#'                    rgb(0,0.5,0,alpha = 0.5))
#' cluster_color <- cluster_color[sim.cluster.data$cluster]
#' cluster_pch <- c(19,15,17)[sim.cluster.data$cluster]
#' par(mfrow=c(2,2))
#' par(mar=c(4,5,2,2))
#'
#' scatterplot3d::scatterplot3d(x=sim.cluster.data$Z1,y = sim.cluster.data$Z2, z=sim.cluster.data$Z3,
#'               color=cluster_color,pch=cluster_pch,
#'               xlab="Z1",ylab="Z2",zlab="Z3",
#'               main="Simulated data in 3 clusters"
#'               )
#' par(mar=c(4,5,2,2))
#' plot(sim.cluster.data[,c("Z2","Z3")],col=cluster_color,pch=cluster_pch,xlab="Z2",ylab="Z3")
#' par(mar=c(4,5,2,2))
#' plot(sim.cluster.data[,c("Z1","Z3")],col=cluster_color,pch=cluster_pch,xlab="Z1",ylab="Z3")
#' par(mar=c(4,5,2,2))
#' plot(sim.cluster.data[,c("Z1","Z2")],col=cluster_color,pch=cluster_pch,xlab="Z1",ylab="Z2")
#'
#'
#' ### Code to generate the simulated data from scratch ###
#'
#' require(MASS)
#' set.seed(0)
#'
#' n.sim <- 100
#' n.cluster <- 3
#' p <- 3
#'
#' mu_sim.cluster.data.Z <- matrix( c(2,2,5,
#'                               6,4,2,
#'                               1,6,2) ,
#'                            nrow=n.cluster, ncol=p, byrow=TRUE)
#'
#' sigma_sim.cluster.data.Z <- array(dim=c(3,3,3))
#' sigma_sim.cluster.data.Z[,,1] <- diag(3)
#' sigma_sim.cluster.data.Z[,,2] <- matrix( c(0.1,0,0,
#'                                       0,2,0,
#'                                       0,0,0.1) ,
#'                            nrow=n.cluster, ncol=p, byrow=TRUE)
#'
#' sigma_sim.cluster.data.Z[,,3] <- matrix( c(2,0,0,
#'                                       0,0.1,0,
#'                                       0,0,0.1) ,
#'                            nrow=n.cluster, ncol=p, byrow=TRUE)
#'
#' sim.cluster.data <- data.frame(cluster=sample(x=1:n.cluster,size=n.sim,replace=TRUE))
#'
#' sim.cluster.data.Z <- matrix(NA,nrow=n.sim,ncol=p)
#'
#' for(i in unique(sim.cluster.data$cluster)) {
#'      sim.cluster.data.Z[sim.cluster.data[,1]==i,] <- MASS::mvrnorm(
#'                                                    n=sum(sim.cluster.data[,1]==i),
#'                                                    mu=mu_sim.cluster.data.Z[i,],
#'                                                    Sigma=sigma_sim.cluster.data.Z[,,i]
#'                                                    )
#' }
#' colnames(sim.cluster.data.Z) <- paste("Z",1:ncol(sim.cluster.data.Z),sep="")
#' sim.cluster.data <- cbind(sim.cluster.data,sim.cluster.data.Z)
#'

NULL
