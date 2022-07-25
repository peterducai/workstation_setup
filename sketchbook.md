# Tensorflow

Download latest stable image

docker run -it -p 8888:8888 tensorflow/tensorflow:latest-jupyter  # Start Jupyter server 




$ mkdir -p $QUAY/postgres-quay
$ setfacl -m u:26:-wx $QUAY/postgres-quay
Use podman run to start the Postgres container, specifying the username, password, database name and port, together with the volume definition for database data:

$ sudo podman run -d --rm --name postgresql-quay \
  -e POSTGRESQL_USER=quayuser \
  -e POSTGRESQL_PASSWORD=quaypass \
  -e POSTGRESQL_DATABASE=quay \
  -e POSTGRESQL_ADMIN_PASSWORD=adminpass \
  -p 5432:5432 \
  -v $QUAY/postgres-quay:/var/lib/pgsql/data:Z \
  registry.redhat.io/rhel8/postgresql-10:1
registry.redhat.io/rhel9/postgresql-13:1-64







 	Why?	What?	How?
One-Pager	• Problem or opportunity
• Hypothesized benefits
 	• Success metrics
• Constraints	• Deliverables
• Define out-of-scope
Design Doc	• Why the problem is important
• Expected ROI
 	• Business / product requirements
• Technical requirements & constraints	• Methodology & system design
• Diagrams, experiment results, tech choices, integration
After-action Review	• Context of incident
• Root cause analysis (5 Whys)
 	• Tangible & intangible impact
• Estimates (e.g., downtime, $)	• Follow-up actions & owners
Writing on this site	• Why reading the post is important (e.g., anecdotes)
 	• The topic being discussed (e.g., documents we write at work)	• The insight being shared (e.g., Why-What-How, examples)