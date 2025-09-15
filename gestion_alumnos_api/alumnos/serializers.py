from rest_framework import serializers
from .models import Alumno


class AlumnoSerializer(serializers.ModelSerializer):
    promedio = serializers.SerializerMethodField()


    class Meta:
        model = Alumno
        fields = ['id', 'nombre', 'numero_documento', 'nota1', 'nota2', 'nota3', 'promedio']


    def get_promedio(self, obj):
        return obj.promedio()

    def validate_numero_documento(self, value):
        """
        Validación personalizada para número de documento
        """
        # Verificar si ya existe otro alumno con el mismo número de documento
        if self.instance:  # Si estamos editando
            # Excluir el alumno actual de la verificación
            if Alumno.objects.filter(numero_documento=value).exclude(id=self.instance.id).exists():
                raise serializers.ValidationError("Ya existe un alumno con este número de documento.")
        else:  # Si estamos creando
            if Alumno.objects.filter(numero_documento=value).exists():
                raise serializers.ValidationError("Ya existe un alumno con este número de documento.")
        
        return value

    def validate_nota1(self, value):
        """
        Validación para nota1
        """
        if value < 0 or value > 5:
            raise serializers.ValidationError("La nota debe estar entre 0 y 5.")
        return value

    def validate_nota2(self, value):
        """
        Validación para nota2
        """
        if value < 0 or value > 5:
            raise serializers.ValidationError("La nota debe estar entre 0 y 5.")
        return value

    def validate_nota3(self, value):
        """
        Validación para nota3
        """
        if value < 0 or value > 5:
            raise serializers.ValidationError("La nota debe estar entre 0 y 5.")
        return value

    def validate_nombre(self, value):
        """
        Validación para nombre
        """
        if len(value.strip()) < 2:
            raise serializers.ValidationError("El nombre debe tener al menos 2 caracteres.")
        return value.strip().title()  # Capitaliza el nombre
