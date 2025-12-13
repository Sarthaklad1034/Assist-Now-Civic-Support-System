import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/l10n/app_localizations.dart';
import '../models/issueModel.dart';
import '../screens/complaintsDetails.dart';

class complaintCard extends StatelessWidget {
  final IssueModel issue;

  const complaintCard({super.key, required this.issue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => complaintsDetails(issue: issue),
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: issue.photo != null
                          ? Image.file(
                        issue.photo!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      )
                          : Container(
                        width: 80,
                        height: 80,
                        color: Colors.grey[100],
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 32,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  issue.category ?? "Other",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              _buildStatusChip(issue.status),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            issue.description ?? "No description",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (issue.address != null)
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined,
                                    size: 14, color: Colors.grey[500]),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    issue.address!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined,
                            size: 14, color: Colors.grey[600]),
                        const SizedBox(width: 6),
                        Text(
                          issue.raisedDate != null
                              ? DateFormat('dd/MM/yyyy').format(issue.raisedDate!.toLocal())
                              : "Unknown",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.viewDetails,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blue[700],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.arrow_forward_ios,
                            size: 12, color: Colors.blue[700]),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(String? status) {
    final statusInfo = _getStatusInfo(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: statusInfo['color'].withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: statusInfo['color'].withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(statusInfo['icon'], size: 12, color: statusInfo['color']),
          const SizedBox(width: 4),
          Text(
            status ?? "Unknown",
            style: TextStyle(
              color: statusInfo['color'],
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _getStatusInfo(String? status) {
    switch (status) {
      case "Resolved":
      case "Closed":
        return {'color': Colors.green, 'icon': Icons.check_circle};
      case "InProgress":
        return {'color': Colors.orange, 'icon': Icons.engineering};
      case "Assigned":
        return {'color': Colors.blue, 'icon': Icons.assignment_turned_in};
      case "Submitted":
        return {'color': Colors.purple, 'icon': Icons.upload};
      default:
        return {'color': Colors.grey, 'icon': Icons.help_outline};
    }
  }
}
