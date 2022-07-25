# Tensorflow

Download latest stable image

docker run -it -p 8888:8888 tensorflow/tensorflow:latest-jupyter  # Start Jupyter server 




$ mkdir -p $HOME/aidb
$ setfacl -m u:26:-wx $HOME/aidb
$ sudo podman run -d --rm --name postgresql-HOME \
  -e POSTGRESQL_USER=aidbuser \
  -e POSTGRESQL_PASSWORD=aidbpass1234 \
  -e POSTGRESQL_DATABASE=aidb \
  -e POSTGRESQL_ADMIN_PASSWORD=adminaidbpass1234 \
  -p 5432:5432 \
  -v $HOME/postgres-HOME:/var/lib/pgsql/data:Z \
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