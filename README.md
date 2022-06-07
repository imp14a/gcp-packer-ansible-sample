This is part of a sample IaC repositorios 

this repositorie includes Packer + Ansible configuration for a site for Get a Pug Site

Before to begin you must create the packer build container using cbuild_container

gcloud compute instance-templates create pug-instance-template \
    --machine-type=e2-standard-4 \
    --image-family=pug-image \
    --image-project=lzone-gsandbox \
    --boot-disk-size=20GB

    gcloud compute instance-templates create pug-instance-template --project=lzone-gsandbox --machine-type=e2-micro --network-interface=subnet=lzone-gsandbox-pug-subnet,no-address --metadata=enable-oslogin=true --maintenance-policy=MIGRATE --provisioning-model=STANDARD --service-account=246877388484-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --region=us-central1  --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any --image-family=pug-image --image-project=lzone-gsandbox 
