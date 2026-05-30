# Yeung Tech Site

Personal/portfolio website for [yeungtech.com.br](https://yeungtech.com.br), built with vanilla HTML/CSS/JavaScript.

## Stack

- **Hosting**: GitHub Pages
- **DNS**: AWS Route 53
- **Infrastructure**: Terraform
- **CI/CD**: GitHub Actions

## Structure

```
├── index.html          # Portuguese version
├── index-en.html       # English version
├── CNAME               # Custom domain for GitHub Pages
└── terraform/          # AWS infrastructure (Route 53 DNS)
```

## Deploy

Every push to `master` automatically:
1. Runs `terraform apply` to keep DNS records up to date
2. GitHub Pages serves the updated site

## Infrastructure Setup (first time)

1. Create the Terraform state bucket:
   ```bash
   aws s3 mb s3://yeungtech-terraform-state --region sa-east-1
   ```

2. Add GitHub Secrets in repository settings:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`

3. Enable GitHub Pages: **Settings → Pages → Deploy from branch → master → / (root)**

4. Point domain registrar (Registro.br) to Route 53 nameservers from Terraform output.
