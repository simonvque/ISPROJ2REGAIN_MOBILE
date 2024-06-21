import 'package:flutter/material.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class RefundPolicyPage extends StatelessWidget {
  const RefundPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Return and refund policy'),
      body: const Markdown(data: """

# __Terms of Use Agreement__
### Acceptance of Terms
  Welcome to ReGain, the mobile app for buying and selling recyclables! These Terms of Use govern your access to and use of our mobile marketplace app. By downloading, accessing, or using this app, you agree to be bound by these terms. This document describes in detail your rights and our rights relating to the provision of the ReGain Service, so please review these terms carefully. Please also see our  Data Privacy Policy, Return and Refund Policy, Cancellation Policy, Penalty Policy, and Commission Policy, which are not part of this agreement.
 
  __1.1 User Consent__

By using the app, you declare that you have read, understood, and agreed to be liable under these terms, as well as any additional terms and conditions that may apply to specific features or services provided through the app. If you are using the app on behalf of an organization or entity, you represent and warrant that you have the authority to bind the organization or entity to these terms, and “you” refers to that organization or entity.

__1.2 Updates to Terms__

ReGain reserves the right to update, modify, or replace these terms at any time without prior notice. Such changes will be effective immediately upon posting on the app. It is your responsibility to review these terms periodically for any updates. Your continued use of the app following the posting of any changes constitutes acceptance of those changes.

__1.3 Discontinuation of Use__

If you do not agree with any changes to these terms, your only course of action is to discontinue using the app. Your continued use of the app after the effective date of any changes constitutes your acceptance of the revised terms. ReGain will not be held responsible for any damage or loss resulting from your continued use of the app.

__1.4 Additional Terms__

Certain features or services provided through the app may be subject to additional terms and conditions, including, but not limited to, the Data Privacy Policy, Return and Refund Policy, Cancellation Policy, Penalty Policy, and Commission Policy. By utilizing these features or services, you consent to abide by the additional terms and conditions specific to each. Please refer to our other terms in their respective sections.

__1.5 Governing Law and Jurisdiction__

The laws of the Republic of the Philippines shall govern these terms and any disputes arising from them or related to the use of the app, without consideration of their conflict of law principles. Any legal action or proceeding arising under these terms shall be brought exclusively in the courts of Metro Manila, and you consent to the jurisdiction of such courts for such purposes.

__1.6 Severability__
If any provision of these terms is held to be invalid or illegal, such provision shall be limited or eliminated to the minimum extent necessary, and the remaining provisions of these terms shall remain in full force and effect.

__1.7 Entire Agreement__
These terms constitute the entire agreement between you and ReGain regarding the use of the app, overriding any prior agreements between you and ReGain relating to the subject matter herein.

__1.8 Contact Us__
If you have any questions or concerns regarding these Terms, please contact us at regain@123mails.com.

### Use of the App
__2.1 Eligibility__

*Age Requirement:* Users must be at least 18 years old to use the app. By using the app, you represent and warrant that you are at least 18 years of age.

*Legal Capacity:* If you are using the app on behalf of an organization or entity, you represent and warrant that you have the authority to bind that organization or entity to these terms, and “you” refers to that organization or entity.

__2.2 Account Registration__

*Account Creation:* In order to access certain features of the app, you may be required to create an account. You agree to provide accurate and complete information when registering for an account.

*Account Security:* You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to notify us immediately of any unauthorized use of your account or any other breach of security.

__2.3 Permitted Use__

*Personal Use:* The app is provided for your personal, non-commercial use only. You agree not to use the app for any commercial purposes without our prior written consent.

*Compliance with Laws:* You agree to use the app in compliance with all applicable laws, regulations, and third-party agreements.

*Prohibited Activities:* You agree not to engage in any unlawful, fraudulent, or abusive behavior while using the app. Prohibited activities include, but are not limited to:
  + Violating any laws or regulations.
  + Interfering with or disrupting the operation of the app.
  + Impersonating any person or entity.
  + Uploading or transmitting any content that is unlawful, harmful, threatening, abusive, harassing, defamatory, vulgar, obscene, or otherwise objectionable.
  + Any item that is not under our terms and conditions must also not be posted. Please refer to our Penalty Policy for the list of items.

__2.4 Suspension or Termination__
*Our Right to Suspend or Terminate:* We reserve the right to suspend or terminate your access to ReGain at any time and for any reason, including, but not limited to, violation of these terms or failure to comply with applicable laws or regulations.

*Effect of Suspension or Termination:* In the event of suspension or termination of your access to the app, you will no longer be able to access your account or use the features of the app. Any provisions of these terms that by their nature should survive termination shall survive termination, including, but not limited to, provisions regarding intellectual property, user conduct, and limitations of liability.

### Solid Waste Transactions
3.1 Listing and Offering
Seller Listings: Sellers may list various types of recyclable waste available for sale on the app, including but not limited to plastics, metals, paper, glass, and electronics.
Offer Process: Buyers may browse through the listings and submit offers for the solid waste items they are interested in purchasing. The offering process may involve specifying the quantity desired, the proposed price, and any other relevant terms or conditions.
Acceptance of Offers: Sellers have the discretion to accept, reject, or counter offers submitted by buyers. Upon acceptance of an offer, a binding agreement is formed between the seller and the buyer for the sale of the specified solid waste items.
3.2 Transaction Terms
Price Offerings: Sellers may specify the price at which they are willing to sell the recyclable waste items listed on the app. Buyers may submit offers at the specified price or propose alternative prices through the offering process.
Payment Terms: Upon acceptance of an offer, buyers are obligated to make payment for the purchased solid waste in accordance with the terms agreed upon with the seller. Payment methods may include cash on delivery or GCash.
Delivery or Pickup: Sellers and buyers are responsible for arranging the delivery or pickup of the purchased recyclable items in accordance with the agreed-upon terms. Delivery may be facilitated through ReGain logistics providers or arranged directly between the parties.
3.3 Dispute Resolution 
Dispute Resolution Process: In the event of any disputes arising from recyclable waste transactions conducted through the app, sellers and buyers agree to make good-faith efforts to resolve the dispute amicably through negotiation and communication.
Mediation: If disputes cannot be resolved through direct negotiation, sellers and buyers may agree to engage in mediation with the assistance of a neutral third party to facilitate resolution.
Arbitration: If mediation is unsuccessful, sellers and buyers may agree to submit the dispute to binding arbitration in accordance with the arbitration rules and procedures agreed upon by both parties.
3.4. Regulatory Compliance
Legal Compliance: Sellers and buyers agree to comply with applicable laws, regulations, and permits governing the sale, purchase, transportation, and disposal of waste in the Philippines.
Environmental Considerations: Sellers and buyers agree to conduct recyclable transactions in an environmentally responsible manner, taking into account the principles of waste reduction, recycling, and proper waste management.



Intellectual Property
4.1 Ownership
Application Content: The entirety of content and materials accessible through the app, encompassing text, graphics, logos, images, videos, and software, belong to ReGain or its licensors. This includes copyright, trademark, patent, trade secret, and other intellectual property statutes that safeguard the mentioned elements.
User Contributions: Users may have the opportunity to contribute content to the app, such as product listings, comments, reviews, or other user-generated content. By contributing content to the app, users grant Regain a worldwide, royalty-free, perpetual, irrevocable, sublicensable, and transferable license to use, reproduce, modify, adapt, publish, translate, distribute, perform, and display such content in connection with the operation and promotion of the app.
4.2 Trademarks
ReGain Trademarks: The ReGain name, logo, and any other trademarks, service marks, trade names, or logos displayed on the app are the registered or unregistered trademarks of ReGain. Users are prohibited from using the ReGain marks without the prior written consent of ReGain.
4.3 Use Restrictions
Prohibited Activities: Users are prohibited from copying, distributing, reproducing, modifying, reverse engineering, or creating derivative works of any content or materials on the app without the prior written consent of Regain or the respective rights holders.
Third-Party Content: Certain content or materials accessible via the application might be furnished by third parties, including sellers and other users. This third-party content is governed by the intellectual property rights of the relevant rights holders and may be safeguarded by copyright, trademark, or other legal statutes.
4.4 Notice of Infringement
Reporting Infringement: If you believe that any content or materials on the app infringe upon your intellectual property rights, please notify us immediately at regain@123mails.com with the following information:
Identification of the copyrighted work, trademark, or other intellectual property right claimed to have been infringed.
Identification of the allegedly infringing content or materials, including specific URLs or other identifying information.
Your contact information, including name, address, contact number, and email address.
A statement that you have a good-faith belief that the use of the copyrighted work, trademark, or other intellectual property is not authorized by the rights holder, its agent, or the law.
A statement by you, made under penalty of perjury, that the information provided in your notice is accurate and that you are the rights holder or authorized to act on behalf of the rights holder.
 
Response to Infringement: Upon receipt of a valid notice of infringement, ReGain may remove or disable access to the allegedly infringing content or materials and take appropriate action as required by law.
4.5 Reservation of Rights
No Waiver: The failure of Regain to enforce any rights or provisions of these terms shall not constitute a waiver of such rights or provisions.
Reservation of Rights: All rights not expressly granted herein are reserved by ReGain.
"""),
    );
  }
}
