import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

class BookSessionPage extends StatefulWidget {
  const BookSessionPage({super.key});

  @override
  State<BookSessionPage> createState() => _BookSessionPageState();
}

class _BookSessionPageState extends State<BookSessionPage> {
  int selectedSessionIndex = 2; // Default to last session (index 2 - Session 3)
  bool isScheduleModalOpen = false;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String selectedDuration = '60 minutes';
  String selectedTherapist = 'Dr. Sarah Johnson';

  // Sample session data (reversed order - oldest first)
  List<Map<String, dynamic>> sessions = [
    {
      'sessionNumber': 1,
      'date': '12 August 2025',
      'isCompleted': true,
      'showScheduleButton': false,
    },
    {
      'sessionNumber': 2,
      'date': '12 August 2025',
      'isCompleted': true,
      'showScheduleButton': false,
    },
    {
      'sessionNumber': 3,
      'date': 'Not Booked Yet',
      'isCompleted': false,
      'showScheduleButton': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Floating particles background
          _buildFloatingParticles(),

          // Main content
          Column(
            children: [
              // Enhanced AppBar with animations
              _buildAnimatedAppBar(),

              // Main content with enhanced animations
              Expanded(child: _buildMainContent()),
            ],
          ),

          // Schedule Modal
          if (isScheduleModalOpen) _buildScheduleModal(),
        ],
      ),
    );
  }

  void _openScheduleModal() {
    setState(() {
      isScheduleModalOpen = true;
      selectedDate = DateTime.now().add(const Duration(days: 1));
      selectedTime = const TimeOfDay(hour: 10, minute: 0);
    });
  }

  void _closeScheduleModal() {
    setState(() {
      isScheduleModalOpen = false;
    });
  }

  void _confirmSchedule() {
    if (selectedDate != null && selectedTime != null) {
      final newSession = {
        'sessionNumber': sessions.length + 1,
        'date':
            '${selectedDate!.day} ${_getMonthName(selectedDate!.month)} ${selectedDate!.year}',
        'time':
            '${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}',
        'isCompleted': false,
        'showScheduleButton': false,
        'duration': selectedDuration,
        'therapist': selectedTherapist,
      };

      setState(() {
        sessions.insert(0, newSession); // Add to beginning (newest first)
        selectedSessionIndex = 0; // Select the new session
        isScheduleModalOpen = false;
      });
    }
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  Widget _buildFloatingParticles() {
    return Positioned.fill(
      child: CustomPaint(
        painter: FloatingParticlesPainter(),
        size: Size.infinite,
      ),
    );
  }

  Widget _buildAnimatedAppBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title:
            const Text(
                  'Book Session',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )
                .animate()
                .fadeIn(duration: 800.ms)
                .slideY(
                  begin: -0.5,
                  end: 0,
                  duration: 800.ms,
                  curve: Curves.easeOutBack,
                ),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios, color: Colors.black54, size: 20)
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideX(
                    begin: -0.3,
                    end: 0,
                    duration: 600.ms,
                    curve: Curves.easeOutCubic,
                  ),
          onPressed: () => context.go('/package-list'),
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Progress Indicator with enhanced animations
            _buildEnhancedProgressIndicator()
                .animate()
                .fadeIn(duration: 1000.ms)
                .slideX(
                  begin: -0.3,
                  end: 0,
                  duration: 1000.ms,
                  curve: Curves.easeOutCubic,
                )
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1.0, 1.0),
                  duration: 1000.ms,
                  curve: Curves.easeOutBack,
                ),

            const SizedBox(height: 24),
            // Treatment Card with stunning effects
            _buildEnhancedTreatmentCard()
                .animate()
                .fadeIn(delay: 200.ms, duration: 1000.ms)
                .slideY(
                  begin: 0.3,
                  end: 0,
                  duration: 1000.ms,
                  curve: Curves.easeOutCubic,
                )
                .scale(
                  begin: const Offset(0.9, 0.9),
                  end: const Offset(1.0, 1.0),
                  duration: 1000.ms,
                  curve: Curves.easeOutBack,
                ),

            const SizedBox(height: 32),
            // Session History Section with dramatic entrance
            _buildSessionHistorySection(),

            const SizedBox(height: 24),
            // Progress Summary Card with floating effect
            _buildEnhancedProgressSummaryCard()
                .animate()
                .fadeIn(delay: 800.ms, duration: 1000.ms)
                .slideY(
                  begin: 0.2,
                  end: 0,
                  duration: 1000.ms,
                  curve: Curves.easeOutCubic,
                )
                .scale(
                  begin: const Offset(0.95, 0.95),
                  end: const Offset(1.0, 1.0),
                  duration: 1000.ms,
                  curve: Curves.easeOutBack,
                ),

            const SizedBox(height: 24),
            // Note Section with typing effect
            _buildEnhancedNoteSection()
                .animate()
                .fadeIn(delay: 900.ms, duration: 1000.ms)
                .slideY(
                  begin: 0.2,
                  end: 0,
                  duration: 1000.ms,
                  curve: Curves.easeOutCubic,
                ),

            const SizedBox(height: 24),
            // Book Session Button with pulse effect
            _buildEnhancedBookSessionButton()
                .animate()
                .fadeIn(delay: 1000.ms, duration: 1000.ms)
                .scaleXY(
                  begin: 0.9,
                  end: 1,
                  duration: 1000.ms,
                  curve: Curves.easeOutBack,
                )
                .then()
                .shimmer(
                  duration: 2000.ms,
                  color: Colors.white.withOpacity(0.3),
                ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // Beautiful Schedule Modal with stunning animations
  Widget _buildScheduleModal() {
    return AnimatedOpacity(
          opacity: isScheduleModalOpen ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.grey[50]!, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                    BoxShadow(
                      color: const Color(0xFFFF6B00).withOpacity(0.1),
                      blurRadius: 40,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header with gradient background
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFFFF6B00),
                              const Color(0xFFFF8C42),
                              const Color(0xFFFFA500),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.schedule,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Expanded(
                              child: Text(
                                'Schedule New Session',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: _closeScheduleModal,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Content
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Date Selection
                            _buildDateSelector(),
                            const SizedBox(height: 24),

                            // Time Selection
                            _buildTimeSelector(),
                            const SizedBox(height: 24),

                            // Duration Selection
                            _buildDurationSelector(),
                            const SizedBox(height: 24),

                            // Therapist Selection
                            _buildTherapistSelector(),
                            const SizedBox(height: 32),

                            // Action Buttons
                            _buildModalActionButtons(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 300.ms)
        .scale(
          begin: const Offset(0.8, 0.8),
          end: const Offset(1.0, 1.0),
          duration: 300.ms,
          curve: Curves.easeOutBack,
        );
  }

  Widget _buildDateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Date',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: _selectDate,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey[50]!,
                  Colors.grey[100]!.withOpacity(0.5),
                  Colors.grey[50]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFFF6B00).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: const Color(0xFFFF6B00),
                  size: 20,
                ),
                const SizedBox(width: 12),
                Text(
                  selectedDate != null
                      ? '${selectedDate!.day} ${_getMonthName(selectedDate!.month)} ${selectedDate!.year}'
                      : 'Select Date',
                  style: TextStyle(
                    fontSize: 16,
                    color: selectedDate != null
                        ? Colors.black
                        : Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_drop_down,
                  color: const Color(0xFFFF6B00),
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Time',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: _selectTime,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey[50]!,
                  Colors.grey[100]!.withOpacity(0.5),
                  Colors.grey[50]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFFF6B00).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: const Color(0xFFFF6B00),
                  size: 20,
                ),
                const SizedBox(width: 12),
                Text(
                  selectedTime != null
                      ? '${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}'
                      : 'Select Time',
                  style: TextStyle(
                    fontSize: 16,
                    color: selectedTime != null
                        ? Colors.black
                        : Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_drop_down,
                  color: const Color(0xFFFF6B00),
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDurationSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Session Duration',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey[50]!,
                Colors.grey[100]!.withOpacity(0.5),
                Colors.grey[50]!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFFF6B00).withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.timer, color: const Color(0xFFFF6B00), size: 20),
              const SizedBox(width: 12),
              Text(
                selectedDuration,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_drop_down,
                color: const Color(0xFFFF6B00),
                size: 24,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTherapistSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Therapist',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey[50]!,
                Colors.grey[100]!.withOpacity(0.5),
                Colors.grey[50]!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFFF6B00).withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.person, color: const Color(0xFFFF6B00), size: 20),
              const SizedBox(width: 12),
              Text(
                selectedTherapist,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_drop_down,
                color: const Color(0xFFFF6B00),
                size: 24,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildModalActionButtons() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: _closeScheduleModal,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: _confirmSchedule,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFFF6B00),
                    const Color(0xFFFF8C42),
                    const Color(0xFFFFA500),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF6B00).withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Confirm Schedule',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFFF6B00),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? const TimeOfDay(hour: 10, minute: 0),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFFF6B00),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Widget _buildSessionHistorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
              'Session History',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            )
            .animate()
            .fadeIn(delay: 400.ms, duration: 600.ms)
            .slideX(
              begin: 0.2,
              end: 0,
              duration: 600.ms,
              curve: Curves.easeOutCubic,
            ),

        const SizedBox(height: 16),
        // Session History ListView with enhanced animations
        SizedBox(
          height: 200.0,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: sessions.length,
            itemBuilder: (context, index) {
              final session = sessions[index];
              final isSelected = selectedSessionIndex == index;

              return Column(
                children: [
                  _buildEnhancedSessionHistoryItem(
                        sessionNumber: session['sessionNumber'] as int,
                        date: session['date'] as String,
                        isCompleted: session['isCompleted'] as bool,
                        showScheduleButton:
                            session['showScheduleButton'] as bool,
                        isSelected: isSelected,
                        time: session['time'] as String?,
                        onTap: () {
                          if (session['showScheduleButton'] as bool) {
                            _openScheduleModal();
                          } else {
                            setState(() {
                              selectedSessionIndex = index;
                            });
                          }
                        },
                      )
                      .animate()
                      .fadeIn(delay: (500 + (index * 150)).ms, duration: 800.ms)
                      .slideX(
                        begin: 0.3,
                        end: 0,
                        duration: 800.ms,
                        curve: Curves.easeOutCubic,
                      )
                      .scale(
                        begin: const Offset(0.9, 0.9),
                        end: const Offset(1.0, 1.0),
                        duration: 800.ms,
                        curve: Curves.easeOutBack,
                      ),
                  if (index < sessions.length - 1)
                    const Divider().animate().fadeIn(
                      delay: (600 + (index * 150)).ms,
                      duration: 400.ms,
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  // Enhanced Progress Indicator with floating effects
  Widget _buildEnhancedProgressIndicator() {
    return Container(
      width: double.infinity,
      height: 50,
      child: Stack(
        children: [
          // Background glow effect
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFFF6B00).withOpacity(0.05),
                  const Color(0xFFFF8C42).withOpacity(0.03),
                  const Color(0xFFFFA500).withOpacity(0.05),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
          ).animate().fadeIn(duration: 1000.ms),

          // Main progress indicator
          Row(
            children: [
              // Step 1 - Session (Current) - Enhanced orange pill
              TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 2000),
                    builder: (context, value, child) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFFFF6B00).withOpacity(
                                (0.8 + (0.2 * value)).clamp(0.0, 1.0),
                              ),
                              const Color(0xFFFF8C42).withOpacity(
                                (0.8 + (0.2 * value)).clamp(0.0, 1.0),
                              ),
                              const Color(0xFFFFA500).withOpacity(
                                (0.8 + (0.2 * value)).clamp(0.0, 1.0),
                              ),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(
                                0xFFFF6B00,
                              ).withOpacity((0.3 * value).clamp(0.0, 1.0)),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Text(
                          'Session',
                          style: TextStyle(
                            color: Color(0xFF8B4513),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      );
                    },
                  )
                  .animate()
                  .scale(duration: 3000.ms, curve: Curves.easeInOut)
                  .then()
                  .shimmer(
                    duration: 2000.ms,
                    color: Colors.white.withOpacity(0.3),
                  ),

              // Connecting line with animation
              Expanded(
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 1500),
                  builder: (context, value, child) {
                    return Container(
                      height: 3,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFFF6B00).withOpacity(0.3),
                            const Color(0xFFFF6B00).withOpacity(0.1 * value),
                            const Color(0xFFFF6B00).withOpacity(0.3),
                          ],
                          stops: [0.0, value, 1.0],
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    );
                  },
                ),
              ),

              // Enhanced progress steps
              _buildEnhancedProgressStep('2'),

              Expanded(
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 1500),
                  builder: (context, value, child) {
                    return Container(
                      height: 3,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFFF6B00).withOpacity(0.1),
                            const Color(0xFFFF6B00).withOpacity(0.3 * value),
                            const Color(0xFFFF6B00).withOpacity(0.1),
                          ],
                          stops: [0.0, value, 1.0],
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    );
                  },
                ),
              ),

              _buildEnhancedProgressStep('3'),

              Expanded(
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 1500),
                  builder: (context, value, child) {
                    return Container(
                      height: 3,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFFF6B00).withOpacity(0.1),
                            const Color(0xFFFF6B00).withOpacity(0.3 * value),
                            const Color(0xFFFF6B00).withOpacity(0.1),
                          ],
                          stops: [0.0, value, 1.0],
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    );
                  },
                ),
              ),

              _buildEnhancedProgressStep('4'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEnhancedProgressStep(String stepNumber) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1200),
      builder: (context, value, child) {
        return Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                const Color(0xFFFF6B00).withOpacity(0.1 + (0.1 * value)),
                const Color(0xFFFF8C42).withOpacity(0.05 + (0.05 * value)),
              ],
              center: Alignment.center,
              radius: 0.8,
            ),
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFFF6B00).withOpacity(0.3 + (0.2 * value)),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF6B00).withOpacity(0.2 * value),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              stepNumber,
              style: TextStyle(
                color: Color(0xFFFF6B00).withOpacity(0.6 + (0.4 * value)),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        );
      },
    ).animate().scale(duration: 2000.ms, curve: Curves.easeInOut);
  }

  // Enhanced Treatment Card with floating effect
  Widget _buildEnhancedTreatmentCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: const Color(0xFFFF6B00).withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 30,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Enhanced image with glow effect
          Container(
                width: 80,
                height: 60,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFFFF6B00).withOpacity(0.1),
                      const Color(0xFFFF8C42).withOpacity(0.05),
                    ],
                    center: Alignment.center,
                    radius: 0.8,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF6B00).withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/face-massage-1.jpg',
                    width: 80,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              .animate()
              .rotate(duration: 2000.ms)
              .then()
              .shimmer(duration: 1500.ms, color: Colors.white.withOpacity(0.3)),
          const SizedBox(width: 20),

          // Enhanced text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Venus Bliss',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    _buildEnhancedWeightLossBadge(),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Register your request for consultation.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnhancedWeightLossBadge() {
    return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 1800),
          builder: (context, value, child) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(
                      0xFFFF6B00,
                    ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                    const Color(
                      0xFFFF8C42,
                    ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                    const Color(
                      0xFFFFA500,
                    ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(
                      0xFFFF6B00,
                    ).withOpacity((0.3 * value).clamp(0.0, 1.0)),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Text(
                'Weight Loss',
                style: TextStyle(
                  color: Color(0xFF8B4513),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          },
        )
        .animate()
        .scale(duration: 2500.ms, curve: Curves.easeInOut)
        .then()
        .shimmer(duration: 1800.ms, color: Colors.white.withOpacity(0.4));
  }

  Widget _buildProgressIndicator() {
    return Container(
      width: double.infinity,
      height: 40,
      child: Row(
        children: [
          // Step 1 - Session (Current) - Orange pill with gradient animation
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 2000),
            builder: (context, value, child) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(
                        0xFFFF6B00,
                      ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                      const Color(
                        0xFFFF8C42,
                      ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                      const Color(
                        0xFFFFA500,
                      ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(
                        0xFFFF6B00,
                      ).withOpacity((0.3 * value).clamp(0.0, 1.0)),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Text(
                  'Session',
                  style: TextStyle(
                    color: Color(0xFF8B4513), // Dark orange text
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              );
            },
          ),

          // Connecting line to step 2
          Expanded(
            child: Container(
              height: 2,
              color: const Color(0xFFFF6B00).withOpacity(0.3),
            ),
          ),

          // Step 2
          _buildProgressStep('2'),

          // Connecting line to step 3
          Expanded(
            child: Container(
              height: 2,
              color: const Color(0xFFFF6B00).withOpacity(0.3),
            ),
          ),

          // Step 3
          _buildProgressStep('3'),

          // Connecting line to step 4
          Expanded(
            child: Container(
              height: 2,
              color: const Color(0xFFFF6B00).withOpacity(0.3),
            ),
          ),

          // Step 4
          _buildProgressStep('4'),
        ],
      ),
    );
  }

  Widget _buildProgressStep(String stepNumber) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: const Color(0xFFFF6B00).withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFFF6B00).withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Center(
        child: Text(
          stepNumber,
          style: const TextStyle(
            color: Color(0xFFFF6B00),
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildTreatmentCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left side - Image
          Container(
            width: 70,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[100],
            ),
            child: const Icon(
              Icons.medical_services,
              color: Colors.grey,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),

          // Right side - Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Venus Bliss',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 1800),
                      builder: (context, value, child) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFFF6B00).withOpacity(
                                  (0.8 + (0.2 * value)).clamp(0.0, 1.0),
                                ),
                                const Color(0xFFFF8C42).withOpacity(
                                  (0.8 + (0.2 * value)).clamp(0.0, 1.0),
                                ),
                                const Color(0xFFFFA500).withOpacity(
                                  (0.8 + (0.2 * value)).clamp(0.0, 1.0),
                                ),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(
                                  0xFFFF6B00,
                                ).withOpacity(0.3 * value),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Text(
                            'Weight Loss',
                            style: TextStyle(
                              color: Color(0xFF8B4513), // Dark orange text
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  'Register your request for consultation.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Enhanced Session History Item with micro-interactions
  Widget _buildEnhancedSessionHistoryItem({
    required int sessionNumber,
    required String date,
    required bool isCompleted,
    bool showScheduleButton = false,
    bool isSelected = false,
    String? time,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: const Color(0xFFFF6B00), width: 2)
              : Border.all(color: Colors.transparent, width: 2),
          gradient: isSelected
              ? LinearGradient(
                  colors: [
                    const Color(0xFFFF6B00).withOpacity(0.05),
                    const Color(0xFFFF8C42).withOpacity(0.03),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFFF6B00).withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Session $sessionNumber',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? const Color(0xFFFF6B00)
                          : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    time != null ? '$date at $time' : date,
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected
                          ? const Color(0xFFFF6B00).withOpacity(0.7)
                          : Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            if (isCompleted)
              TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 1600),
                    builder: (context, value, child) {
                      return Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            colors: [
                              const Color(0xFFFF6B00).withOpacity(
                                (0.8 + (0.2 * value)).clamp(0.0, 1.0),
                              ),
                              const Color(0xFFFF8C42).withOpacity(
                                (0.8 + (0.2 * value)).clamp(0.0, 1.0),
                              ),
                              const Color(0xFFFFA500).withOpacity(
                                (0.8 + (0.2 * value)).clamp(0.0, 1.0),
                              ),
                            ],
                            center: Alignment.center,
                            radius: 0.8,
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(
                                0xFFFF6B00,
                              ).withOpacity((0.3 * value).clamp(0.0, 1.0)),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Color(0xFF8B4513),
                          size: 18,
                        ),
                      );
                    },
                  )
                  .animate()
                  .scale(duration: 2000.ms, curve: Curves.easeInOut)
                  .then()
                  .shimmer(
                    duration: 1500.ms,
                    color: Colors.white.withOpacity(0.4),
                  )
            else if (showScheduleButton)
              TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 1700),
                    builder: (context, value, child) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFFFF6B00).withOpacity(
                                (0.8 + (0.2 * value)).clamp(0.0, 1.0),
                              ),
                              const Color(0xFFFF8C42).withOpacity(
                                (0.8 + (0.2 * value)).clamp(0.0, 1.0),
                              ),
                              const Color(0xFFFFA500).withOpacity(
                                (0.8 + (0.2 * value)).clamp(0.0, 1.0),
                              ),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(
                                0xFFFF6B00,
                              ).withOpacity((0.3 * value).clamp(0.0, 1.0)),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.schedule,
                              color: Color(0xFF8B4513),
                              size: 16,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Set a schedule',
                              style: TextStyle(
                                color: Color(0xFF8B4513),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                  .animate()
                  .scale(duration: 2500.ms, curve: Curves.easeInOut)
                  .then()
                  .shimmer(
                    duration: 1800.ms,
                    color: Colors.white.withOpacity(0.4),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionHistoryItem({
    required int sessionNumber,
    required String date,
    required bool isCompleted,
    bool showScheduleButton = false,
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? Border.all(color: const Color(0xFFFF6B00), width: 2)
              : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Session $sessionNumber',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            if (isCompleted)
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 1600),
                builder: (context, value, child) {
                  return Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          const Color(
                            0xFFFF6B00,
                          ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                          const Color(
                            0xFFFF8C42,
                          ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                          const Color(
                            0xFFFFA500,
                          ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                        ],
                        center: Alignment.center,
                        radius: 0.8,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFFFF6B00,
                          ).withOpacity(0.3 * value),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Color(0xFF8B4513),
                      size: 16,
                    ),
                  );
                },
              )
            else if (showScheduleButton)
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 1700),
                builder: (context, value, child) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(
                            0xFFFF6B00,
                          ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                          const Color(
                            0xFFFF8C42,
                          ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                          const Color(
                            0xFFFFA500,
                          ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFFFF6B00,
                          ).withOpacity(0.3 * value),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Color(0xFF8B4513),
                          size: 14,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Set a schedule',
                          style: TextStyle(
                            color: Color(0xFF8B4513),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  // Enhanced Progress Summary Card with floating effects
  Widget _buildEnhancedProgressSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFFFFF4E6).withOpacity(0.9),
            const Color(0xFFFFF8F0).withOpacity(0.9),
            const Color(0xFFFFF4E6).withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 25,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: const Color(0xFFFF6B00).withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 40,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Enhanced decorative background elements
          Positioned(
            left: -20,
            top: -20,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 2000),
              curve: Curves.easeOutBack,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Transform.rotate(
                    angle: value * 0.2,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            const Color(0xFFFF6B00).withOpacity(0.15 * value),
                            const Color(0xFFFF8C42).withOpacity(0.1 * value),
                          ],
                          center: Alignment.center,
                          radius: 0.8,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            right: -25,
            bottom: -25,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 2500),
              curve: Curves.easeOutBack,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Transform.rotate(
                    angle: -value * 0.25,
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            const Color(0xFFFFA500).withOpacity(0.12 * value),
                            const Color(0xFFFF6B00).withOpacity(0.08 * value),
                          ],
                          center: Alignment.center,
                          radius: 0.8,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Main content with enhanced animations
          Row(
            children: [
              // Enhanced circular progress indicator
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeOutBack,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Container(
                      width: 80,
                      height: 80,
                      child: Stack(
                        children: [
                          // Enhanced background circle
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                colors: [
                                  const Color(0xFFFF6B00).withOpacity(0.2),
                                  const Color(0xFFFF8C42).withOpacity(0.1),
                                ],
                                center: Alignment.center,
                                radius: 0.8,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFFFF6B00,
                                  ).withOpacity(0.3),
                                  blurRadius: 15,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                          // Enhanced progress ring
                          TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 0.0, end: 0.6),
                            duration: const Duration(milliseconds: 2000),
                            curve: Curves.easeInOutCubic,
                            builder: (context, progressValue, child) {
                              return Container(
                                width: 80,
                                height: 80,
                                child: CustomPaint(
                                  painter: EnhancedProgressRingPainter(
                                    progress: progressValue,
                                    color: const Color(0xFFFF6B00),
                                    strokeWidth: 8,
                                  ),
                                ),
                              );
                            },
                          ),
                          // Enhanced center text
                          TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeOutBack,
                            builder: (context, textValue, child) {
                              return Transform.scale(
                                scale: textValue,
                                child: const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '2',
                                        style: TextStyle(
                                          color: Color(0xFF8B4513),
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Left',
                                        style: TextStyle(
                                          color: Color(0xFF8B4513),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 28),

              // Enhanced text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Enhanced title with slide animation
                    TweenAnimationBuilder<Offset>(
                      tween: Tween<Offset>(
                        begin: const Offset(0.4, 0),
                        end: Offset.zero,
                      ),
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: value,
                          child: Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  'Venus Bliss',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFF6B00),
                                    letterSpacing: -0.5,
                                  ),
                                ),
                              ),
                              // Enhanced badge with scale animation
                              TweenAnimationBuilder<double>(
                                    tween: Tween<double>(begin: 0.0, end: 1.0),
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.elasticOut,
                                    builder: (context, badgeValue, child) {
                                      return Transform.scale(
                                        scale: badgeValue,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                const Color(
                                                  0xFFFF6B00,
                                                ).withOpacity(
                                                  (0.8 + (0.2 * badgeValue))
                                                      .clamp(0.0, 1.0),
                                                ),
                                                const Color(
                                                  0xFFFF8C42,
                                                ).withOpacity(
                                                  (0.8 + (0.2 * badgeValue))
                                                      .clamp(0.0, 1.0),
                                                ),
                                                const Color(
                                                  0xFFFFA500,
                                                ).withOpacity(
                                                  (0.8 + (0.2 * badgeValue))
                                                      .clamp(0.0, 1.0),
                                                ),
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              18,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color(
                                                  0xFFFF6B00,
                                                ).withOpacity(0.4 * badgeValue),
                                                blurRadius: 12,
                                                offset: const Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: const Text(
                                            '3/5 Done',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF8B4513),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                  .animate()
                                  .scale(
                                    duration: 3000.ms,
                                    curve: Curves.easeInOut,
                                  )
                                  .then()
                                  .shimmer(
                                    duration: 2000.ms,
                                    color: Colors.white.withOpacity(0.4),
                                  ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    // Enhanced description text
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 25 * (1 - value)),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 16,
                                  color: const Color(0xFF8B4513),
                                  height: 1.6,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: const [
                                  TextSpan(
                                    text: "You've completed 3 sessions — only ",
                                  ),
                                  TextSpan(
                                    text: "2 sessions left to go!",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFFF6B00),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4E6), // Light orange background
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative background elements with animation
          Positioned(
            left: -15,
            top: -15,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeOutBack,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Transform.rotate(
                    angle: value * 0.1,
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF6B00).withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            right: -20,
            bottom: -20,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 1400),
              curve: Curves.easeOutBack,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Transform.rotate(
                    angle: -value * 0.15,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF6B00).withOpacity(0.08),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Main content with staggered animations
          Row(
            children: [
              // Left side - Circular progress indicator with animation
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeOutBack,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Container(
                      width: 70,
                      height: 70,
                      child: Stack(
                        children: [
                          // Background circle
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF6B00).withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                          ),
                          // Progress ring with animation
                          TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 0.0, end: 0.6),
                            duration: const Duration(milliseconds: 1500),
                            curve: Curves.easeInOutCubic,
                            builder: (context, progressValue, child) {
                              return Container(
                                width: 70,
                                height: 70,
                                child: CustomPaint(
                                  painter: ProgressRingPainter(
                                    progress: progressValue,
                                    color: const Color(0xFFFF6B00),
                                    strokeWidth: 6,
                                  ),
                                ),
                              );
                            },
                          ),
                          // Center text with animation
                          TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.easeOutBack,
                            builder: (context, textValue, child) {
                              return Transform.scale(
                                scale: textValue,
                                child: const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '2',
                                        style: TextStyle(
                                          color: Color(
                                            0xFF8B4513,
                                          ), // Dark orange/brown
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Left',
                                        style: TextStyle(
                                          color: Color(
                                            0xFF8B4513,
                                          ), // Dark orange/brown
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 24),

              // Right side - Text content with staggered animations
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title with slide animation
                    TweenAnimationBuilder<Offset>(
                      tween: Tween<Offset>(
                        begin: const Offset(0.3, 0),
                        end: Offset.zero,
                      ),
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: value,
                          child: Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  'Venus Bliss',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFF6B00), // Vibrant orange
                                    letterSpacing: -0.5,
                                  ),
                                ),
                              ),
                              // Badge with scale animation
                              TweenAnimationBuilder<double>(
                                tween: Tween<double>(begin: 0.0, end: 1.0),
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.elasticOut,
                                builder: (context, badgeValue, child) {
                                  return Transform.scale(
                                    scale: badgeValue,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color(0xFFFF6B00).withOpacity(
                                              (0.8 + (0.2 * badgeValue)).clamp(
                                                0.0,
                                                1.0,
                                              ),
                                            ),
                                            const Color(0xFFFF8C42).withOpacity(
                                              (0.8 + (0.2 * badgeValue)).clamp(
                                                0.0,
                                                1.0,
                                              ),
                                            ),
                                            const Color(0xFFFFA500).withOpacity(
                                              (0.8 + (0.2 * badgeValue)).clamp(
                                                0.0,
                                                1.0,
                                              ),
                                            ),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(
                                              0xFFFF6B00,
                                            ).withOpacity(0.3 * badgeValue),
                                            blurRadius: 8,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: const Text(
                                        '3/5 Done',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF8B4513),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    // Description text with fade and slide animation
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 20 * (1 - value)),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 15,
                                  color: const Color(
                                    0xFF8B4513,
                                  ), // Dark orange/brown
                                  height: 1.5,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: const [
                                  TextSpan(
                                    text: "You've completed 3 sessions — only ",
                                  ),
                                  TextSpan(
                                    text: "2 sessions left to go!",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFFF6B00),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Enhanced Note Section with typing effect
  Widget _buildEnhancedNoteSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 1900),
                  builder: (context, value, child) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            const Color(0xFFFF6B00).withOpacity(
                              (0.8 + (0.2 * value)).clamp(0.0, 1.0),
                            ),
                            const Color(0xFFFF8C42).withOpacity(
                              (0.8 + (0.2 * value)).clamp(0.0, 1.0),
                            ),
                            const Color(0xFFFFA500).withOpacity(
                              (0.8 + (0.2 * value)).clamp(0.0, 1.0),
                            ),
                          ],
                          center: Alignment.center,
                          radius: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(
                              0xFFFF6B00,
                            ).withOpacity((0.3 * value).clamp(0.0, 1.0)),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.note_add,
                        color: Color(0xFF8B4513),
                        size: 16,
                      ),
                    );
                  },
                )
                .animate()
                .rotate(duration: 2000.ms)
                .then()
                .shimmer(
                  duration: 1500.ms,
                  color: Colors.white.withOpacity(0.4),
                ),
            const SizedBox(width: 12),
            const Text(
              'Note',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF8B4513),
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey[50]!,
                Colors.grey[100]!.withOpacity(0.5),
                Colors.grey[50]!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFFF6B00).withOpacity(0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 15,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: const Color(0xFFFF6B00).withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Had irritation after last laser session, want to discuss before next treatment.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              _buildEnhancedEditButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEnhancedEditButton() {
    return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 2000),
          builder: (context, value, child) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(
                      0xFFFF6B00,
                    ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                    const Color(
                      0xFFFF8C42,
                    ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                    const Color(
                      0xFFFFA500,
                    ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(
                      0xFFFF6B00,
                    ).withOpacity((0.3 * value).clamp(0.0, 1.0)),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.edit, color: Color(0xFF8B4513), size: 16),
                  SizedBox(width: 8),
                  Text(
                    'Edit',
                    style: TextStyle(
                      color: Color(0xFF8B4513),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          },
        )
        .animate()
        .scale(duration: 2500.ms, curve: Curves.easeInOut)
        .then()
        .shimmer(duration: 1800.ms, color: Colors.white.withOpacity(0.4));
  }

  // Enhanced Book Session Button with pulse effect
  Widget _buildEnhancedBookSessionButton() {
    return Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFFFF6B00),
                const Color(0xFFFF8C42),
                const Color(0xFFFFA500),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF6B00).withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: const Color(0xFFFF6B00).withOpacity(0.2),
                blurRadius: 40,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              // Navigate to booking confirmation or next step
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text(
                    'Session booking functionality would be implemented here',
                  ),
                  backgroundColor: const Color(0xFFFF6B00),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Book Session',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        )
        .animate()
        .scale(duration: 3000.ms, curve: Curves.easeInOut)
        .then()
        .shimmer(duration: 2500.ms, color: Colors.white.withOpacity(0.3));
  }

  Widget _buildNoteSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 1900),
              builder: (context, value, child) {
                return Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        const Color(
                          0xFFFF6B00,
                        ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                        const Color(
                          0xFFFF8C42,
                        ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                        const Color(
                          0xFFFFA500,
                        ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                      ],
                      center: Alignment.center,
                      radius: 0.8,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(
                          0xFFFF6B00,
                        ).withOpacity((0.3 * value).clamp(0.0, 1.0)),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.note_add,
                    color: Color(0xFF8B4513),
                    size: 14,
                  ),
                );
              },
            ),
            const SizedBox(width: 10),
            const Text(
              'Note',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Color(0xFF8B4513), // Dark orange text
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Had irritation after last laser session, want to discuss before next treatment.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[800],
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 2000),
                builder: (context, value, child) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(
                            0xFFFF6B00,
                          ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                          const Color(
                            0xFFFF8C42,
                          ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                          const Color(
                            0xFFFFA500,
                          ).withOpacity((0.8 + (0.2 * value)).clamp(0.0, 1.0)),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFFFF6B00,
                          ).withOpacity(0.3 * value),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.edit, color: Color(0xFF8B4513), size: 14),
                        SizedBox(width: 6),
                        Text(
                          'Edit',
                          style: TextStyle(
                            color: Color(0xFF8B4513),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBookSessionButton() {
    return SizedBox(
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text(
          'Book Session',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ProgressRingPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  ProgressRingPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Draw the progress arc
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Start from top and go clockwise
    const startAngle = -math.pi / 2; // Start from top
    final sweepAngle = 2 * math.pi * progress; // Progress percentage

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is ProgressRingPainter &&
        (oldDelegate.progress != progress ||
            oldDelegate.color != color ||
            oldDelegate.strokeWidth != strokeWidth);
  }
}

class FloatingParticlesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF6B00).withOpacity(0.03)
      ..style = PaintingStyle.fill;

    final random = math.Random(42); // Fixed seed for consistent particles

    // Draw floating particles
    for (int i = 0; i < 15; i++) {
      final x = (size.width * random.nextDouble());
      final y = (size.height * random.nextDouble());
      final radius = 2 + (random.nextDouble() * 3);

      canvas.drawCircle(
        Offset(x, y),
        radius,
        paint
          ..color = Color(
            0xFFFF6B00,
          ).withOpacity(0.02 + (random.nextDouble() * 0.03)),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class EnhancedProgressRingPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  EnhancedProgressRingPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Draw the enhanced progress arc with gradient effect
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [color, color.withOpacity(0.8), color.withOpacity(0.6)],
        stops: [0.0, 0.7, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Start from top and go clockwise
    const startAngle = -math.pi / 2; // Start from top
    final sweepAngle = 2 * math.pi * progress; // Progress percentage

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is EnhancedProgressRingPainter &&
        (oldDelegate.progress != progress ||
            oldDelegate.color != color ||
            oldDelegate.strokeWidth != strokeWidth);
  }
}
