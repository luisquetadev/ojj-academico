package com.ojj.academico.utils;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public final class DateUtils {
    private DateUtils() {}

    public static final DateTimeFormatter DATE_FORMAT = DateTimeFormatter.ISO_LOCAL_DATE;
    public static final DateTimeFormatter DATETIME_FORMAT = DateTimeFormatter.ISO_LOCAL_DATE_TIME;

    public static LocalDate parseDate(String value) {
        if (value == null || value.isBlank()) return null;
        return LocalDate.parse(value, DATE_FORMAT);
    }

    public static LocalDateTime parseDateTime(String value) {
        if (value == null || value.isBlank()) return null;
        return LocalDateTime.parse(value, DATETIME_FORMAT);
    }

    public static String formatDate(LocalDate date) {
        return date == null ? null : date.format(DATE_FORMAT);
    }

    public static String formatDateTime(LocalDateTime dt) {
        return dt == null ? null : dt.format(DATETIME_FORMAT);
    }
}
