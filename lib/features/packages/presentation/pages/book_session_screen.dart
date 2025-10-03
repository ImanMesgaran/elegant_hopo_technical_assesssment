import 'package:elegant_hopo_technical_assessment/features/packages/presentation/widgets/note_section.dart';
import 'package:elegant_hopo_technical_assessment/features/packages/presentation/widgets/progress_summary.dart';
import 'package:elegant_hopo_technical_assessment/features/packages/presentation/widgets/session_history_item.dart';
import 'package:elegant_hopo_technical_assessment/features/packages/presentation/widgets/session_stepper.dart';
import 'package:elegant_hopo_technical_assessment/features/packages/presentation/widgets/treatment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class BookSessionScreen extends StatefulWidget {
  const BookSessionScreen({super.key});

  @override
  State<BookSessionScreen> createState() => _BookSessionScreenState();
}

class _BookSessionScreenState extends State<BookSessionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Book Session',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: 20,
          ),
          onPressed: () => context.go('/package-list'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const SessionStepper(currentStep: 1)
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideX(
                    begin: -0.1,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOutQuad,
                  ),

              const SizedBox(height: 24),
              const TreatmentCard(
                    title: 'Venus Bliss',
                    subtitle: 'Register your request for consultation.',
                    category: 'Weight Loss',
                    imagePath: 'assets/images/images_01.jpg',
                  )
                  .animate()
                  .fadeIn(delay: 200.ms, duration: 600.ms)
                  .slideY(
                    begin: 0.1,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOutQuad,
                  ),

              const SizedBox(height: 32),
              const Text(
                'Session History',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ).animate().fadeIn(delay: 400.ms, duration: 600.ms),

              const SizedBox(height: 16),
              const SessionHistoryItem(
                    sessionNumber: 1,
                    date: '12 August 2025',
                    isCompleted: true,
                  )
                  .animate()
                  .fadeIn(delay: 500.ms, duration: 600.ms)
                  .slideX(
                    begin: 0.1,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOutQuad,
                  ),

              const Divider(),
              const SessionHistoryItem(
                    sessionNumber: 2,
                    date: '12 August 2025',
                    isCompleted: true,
                  )
                  .animate()
                  .fadeIn(delay: 600.ms, duration: 600.ms)
                  .slideX(
                    begin: 0.1,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOutQuad,
                  ),

              const Divider(),
              const SessionHistoryItem(
                    sessionNumber: 3,
                    date: 'Not Booked Yet',
                    isCompleted: false,
                    showScheduleButton: true,
                  )
                  .animate()
                  .fadeIn(delay: 700.ms, duration: 600.ms)
                  .slideX(
                    begin: 0.1,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOutQuad,
                  ),

              const SizedBox(height: 24),
              const ProgressSummary(
                    title: 'Venus Bliss',
                    completedSessions: 3,
                    totalSessions: 5,
                    remainingSessions: 2,
                  )
                  .animate()
                  .fadeIn(delay: 800.ms, duration: 600.ms)
                  .slideY(
                    begin: 0.1,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOutQuad,
                  ),

              const SizedBox(height: 24),
              const NoteSection(
                    note:
                        'Had irritation after last laser session, want to discuss before next treatment.',
                  )
                  .animate()
                  .fadeIn(delay: 900.ms, duration: 600.ms)
                  .slideY(
                    begin: 0.1,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOutQuad,
                  ),

              const SizedBox(height: 24),
              SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to booking confirmation or next step
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Session booking functionality would be implemented here',
                            ),
                            backgroundColor: Color(0xFFFF6B00),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6B00),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Book Session',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(delay: 1000.ms, duration: 600.ms)
                  .scaleXY(
                    begin: 0.95,
                    end: 1,
                    duration: 600.ms,
                    curve: Curves.easeOutQuad,
                  ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
